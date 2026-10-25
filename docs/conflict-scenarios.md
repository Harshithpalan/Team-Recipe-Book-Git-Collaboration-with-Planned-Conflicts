# Git Collaboration Lab — Planned Merge Conflict Scenarios
**Project:** Team Recipe Book (`CulinaryCraft`)  
**Technology Stack:** Pure HTML5, CSS3, Git, GitHub  

---

## Executive Summary
This document provides an exhaustive, step-by-step laboratory log detailing the creation, detection, analysis, and resolution of three planned Git merge conflict scenarios. These scenarios simulate realistic friction points encountered in multi-developer team environments:

1. **Scenario 1:** Same-Line Content Collision in HTML (`index.html`)
2. **Scenario 2:** CSS Property Declaration Collision (`css/style.css`)
3. **Scenario 3:** Modify vs. Delete Collision on a File Entity (`recipes/pasta.html`)

---

## Scenario 1: Same-Line Content Collision (HTML)

### 1.1 Objective & Background
When two developers modify the exact same line of code or structural markup starting from a common base commit, Git cannot deterministically infer which modification represents the authoritative business intent. Git marks the region with conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) and halts the merge, requiring manual human intervention.

### 1.2 Target File & Baseline State
- **File:** `index.html`
- **Location:** Line 105 (Featured Section Heading)
- **Base Commit Code:**
  ```html
  <h2 class="section-title">Our Favorite Recipes</h2>
  ```

### 1.3 Developer Branch Actions
- **Developer A Branch:** `feature/breakfast-recipes`
  - Change authored:
    ```html
    <h2 class="section-title">Breakfast Favorites</h2>
    ```
  - Commit message: `"Update featured heading to Breakfast Favorites"`

- **Developer B Branch:** `feature/dinner-recipes`
  - Change authored:
    ```html
    <h2 class="section-title">Community Recipe Collection</h2>
    ```
  - Commit message: `"Update featured heading to Community Recipe Collection"`

### 1.4 Conflict Trigger Procedure
```bash
# 1. Switch to main baseline
git switch main

# 2. Merge Developer A's branch (Succeeds cleanly)
git merge --no-ff feature/breakfast-recipes -m "Merge branch 'feature/breakfast-recipes' into main"

# 3. Attempt to merge Developer B's branch (Triggers Conflict)
git merge --no-ff feature/dinner-recipes
```

### 1.5 Git Conflict Output
```text
Auto-merging index.html
CONFLICT (content): Merge conflict in index.html
Automatic merge failed; fix conflicts and then commit the result.
```

### 1.6 Anatomy of the Conflict Markers
Opening `index.html` reveals Git's three-part delimiter structure:
```html
<<<<<<< HEAD
            <h2 class="section-title">Breakfast Favorites</h2>
=======
            <h2 class="section-title">Community Recipe Collection</h2>
>>>>>>> feature/dinner-recipes
```
- **`<<<<<<< HEAD`**: Marks the beginning of lines currently on the active target branch (`main`, which received Developer A's commit).
- **`=======`**: The center dividing boundary separating the two competing versions.
- **`>>>>>>> feature/dinner-recipes`**: Marks the ending boundary with the incoming branch name.

### 1.7 Resolution Rationale & Execution
- **Decision:** As the recipe catalog contains breakfast, dinner, and desserts, titling the section *"Breakfast Favorites"* narrows the scope and excludes Developer B's dishes. The title *"Community Recipe Collection"* accurately reflects all culinary contributions.
- **Resolution Steps:**
  1. Open `index.html` in VS Code.
  2. Delete lines containing `<<<<<<< HEAD`, `=======`, `>>>>>>> feature/dinner-recipes`, and the duplicate heading.
  3. Ensure valid HTML remains:
     ```html
     <h2 class="section-title" id="featured-heading">Community Recipe Collection</h2>
     ```
  4. Finalize the merge:
     ```bash
     git add index.html
     git commit -m "Resolve recipe homepage title conflict: unify as Community Recipe Collection"
     ```

---

## Scenario 2: CSS Property Conflict (Styling Collisions)

### 2.1 Objective & Background
Stylesheets frequently cause non-trivial merge conflicts when two designers or developers adjust identical selector rules or property values independently.

### 2.2 Target File & Baseline State
- **File:** `css/style.css`
- **Selector:** `.recipe-title`
- **Base Commit Code:**
  ```css
  .recipe-title {
    font-family: var(--font-heading);
    font-size: 1.35rem;
    font-weight: 700;
    color: #333333;
    margin-bottom: 0.65rem;
  }
  ```

### 2.3 Developer Branch Actions
- **Developer A (`feature/breakfast-recipes`):**
  - Updated color to organic forest green:
    ```css
    color: #2e7d32;
    ```
- **Developer B (`feature/dinner-recipes`):**
  - Updated color to warm amber roast:
    ```css
    color: #b45309;
    ```

### 2.4 Git Conflict Output
```text
Auto-merging css/style.css
CONFLICT (content): Merge conflict in css/style.css
Automatic merge failed; fix conflicts and then commit the result.
```

### 2.5 Conflict Markers in Code
```css
<<<<<<< HEAD
    color: #2e7d32;
=======
    color: #b45309;
>>>>>>> feature/dinner-recipes
```

### 2.6 Resolution Rationale & Execution
- **Decision:** The team evaluated both color palettes using Web Content Accessibility Guidelines (WCAG 2.1 AA). `#2e7d32` yields a 5.4:1 contrast ratio against `#ffffff`, surpassing the 4.5:1 requirement. Amber `#b45309` is repositioned as a hover or highlight accent.
- **Terminal Execution:**
  ```bash
  # Stage the resolved CSS file
  git add css/style.css
  git commit -m "Resolve recipe title style conflict: retain accessible #2e7d32 palette"
  ```

---

## Scenario 3: Modify vs. Delete Conflict (Tree Structural Collision)

### 3.1 Objective & Background
A modify/delete conflict occurs when one collaborator updates the contents of a file while another collaborator deletes or renames that exact file on an independent branch. Git preserves the modified version in the working tree and halts the merge to prevent silent loss of authored work.

### 3.2 Target File & Baseline State
- **File:** `recipes/pasta.html` (Creamy Fettuccine Alfredo)
- **Baseline:** Starter draft of pasta recipe.

### 3.3 Developer Branch Actions
- **Developer A (`feature/breakfast-recipes` or `feature/pasta-enhancement`):**
  - Expanded instructions, added ingredients (heavy cream, Parmigiano-Reggiano, reserved starchy water), cooking timers, and chef notes.
  - Committed as `"Enhance creamy fettuccine alfredo recipe with emulsification procedure"`.
- **Developer B (`feature/dinner-recipes`):**
  - Thought the file was legacy draft code and deleted it:
    ```bash
    git rm recipes/pasta.html
    git commit -m "Remove legacy draft recipes/pasta.html"
    ```

### 3.4 Git Conflict Output
```text
CONFLICT (modify/delete): recipes/pasta.html deleted in feature/dinner-recipes
and modified in HEAD. Version HEAD of recipes/pasta.html left in tree.
Automatic merge failed; fix conflicts and then commit the result.
```

### 3.5 Status Inspection
```bash
git status
```
```text
Unmerged paths:
  (use "git add/rm <file>..." as appropriate to mark resolution)
	deleted by them: recipes/pasta.html
```

### 3.6 Resolution Options & Decision
1. **Option 1 (Retain File):** If the revisions are valuable, stage the file to preserve it:
   ```bash
   git add recipes/pasta.html
   git commit -m "Resolve pasta recipe modify-delete conflict: retain Developer A's enhanced recipe"
   ```
2. **Option 2 (Accept Deletion):** If the deletion was intentional and correct:
   ```bash
   git rm recipes/pasta.html
   git commit -m "Resolve pasta recipe modify-delete conflict: confirm file deletion"
   ```
- **Selected Resolution:** **Option 1 (Retain File)**. Developer A's enhancements added genuine culinary value and completed the dinner catalog requirements.

---

## Summary Matrix of Conflict Scenarios

| Scenario | Target File | Conflict Type | Branch A Action | Branch B Action | Chosen Resolution |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **#1** | `index.html` | Same-Line Content | Set H2 to "Breakfast Favorites" | Set H2 to "Community Recipe Collection" | "Community Recipe Collection" |
| **#2** | `css/style.css` | Shared Property | Set `.recipe-title` to `#2e7d32` | Set `.recipe-title` to `#b45309` | Retained `#2e7d32` (WCAG AA compliant) |
| **#3** | `recipes/pasta.html` | Modify / Delete | Added detailed recipe & instructions | Deleted file via `git rm` | Retained modified file via `git add` |
