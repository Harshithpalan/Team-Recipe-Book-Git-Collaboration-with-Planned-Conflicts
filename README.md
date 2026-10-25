# 🍳 CulinaryCraft — Team Recipe Book
### Collaborative Web Platform with Planned Git Merge Conflicts
*Built with pure HTML5 &amp; CSS3 • Real-world Git &amp; GitHub Collaboration Lab*

[![Git Version](https://img.shields.io/badge/Git-2.40%2B-F05032?logo=git&logoColor=white)](#)
[![HTML5](https://img.shields.io/badge/HTML5-Semantic%20Markup-E34F26?logo=html5&logoColor=white)](#)
[![CSS3](https://img.shields.io/badge/CSS3-Modern%20Design%20System-1572B6?logo=css3&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](#)

---

## 📖 Project Overview
**CulinaryCraft** is a collaborative recipe-book website where multiple developers contribute recipes, update shared stylesheets, and intentionally engineer real-world Git merge conflicts. The team documents the collisions, inspects Git's conflict markers, resolves the differences, and cleanly integrates the final website through GitHub pull requests.

### Key Objectives
1. **Develop a Responsive Recipe Website:** High-aesthetic, responsive, pure HTML5 &amp; CSS3 platform with no backend or JavaScript required.
2. **Master Team Git Operations:** Repositories, branching, commits, pulls, pushes, and fast-forward vs non-fast-forward merges.
3. **Simulate 3 Planned Conflicts:**
   - **Scenario 1:** Same-line HTML heading collision (`index.html`)
   - **Scenario 2:** Conflicting CSS styling properties (`css/style.css`)
   - **Scenario 3:** Modify vs Delete tree conflict (`recipes/pasta.html`)
4. **Demonstrate GitHub Pull Request Workflow:** Code reviews, conflict alerts, and resolving conflicts locally to clear PRs.
5. **Preserve Complete Evidence:** Dedicated [Git Collaboration Lab](pages/collaboration.html) and comprehensive technical reports.

---

## 📁 Project Structure

```text
team-recipe-book/
│
├── index.html                   # Home page & featured recipe showcase
├── .gitignore                   # Standard OS & editor exclusions
├── README.md                    # Project documentation & quickstart
│
├── pages/
│   ├── recipes.html             # Complete recipe catalog with category filters
│   ├── breakfast.html           # Breakfast collection (Developer A's branch)
│   ├── desserts.html            # Dessert gallery (Developer B's branch)
│   └── collaboration.html       # Visual Git Conflict Lab & interactive diff viewer
│
├── recipes/
│   ├── pancakes.html            # Golden Buttermilk Pancakes (Dev A)
│   ├── pasta.html               # Creamy Fettuccine Alfredo (Conflict 3 Subject)
│   └── fruit-salad.html         # Rainbow Citrus Fruit Salad (Team Collab)
│
├── css/
│   ├── style.css                # Global design system, typography, colors, layout
│   └── recipes.css              # Recipe detail layouts, cards, checklists & lab diffs
│
└── docs/
    ├── conflict-scenarios.md    # Step-by-step reproduction guide for all 3 conflicts
    ├── git-workflow.md          # Team branching standards, PR lifecycle & checklist
    └── project-report.md        # Complete 15-section technical project report
```

---

## ⚡ Quickstart & Local Setup

### Step 1: Clone or Open the Repository
```bash
# Clone the repository
git clone https://github.com/YOUR-USERNAME/team-recipe-book.git
cd team-recipe-book
```

### Step 2: Run Locally
Because this project uses vanilla HTML5 and CSS3:
- Simply double-click `index.html` to open it in any web browser, OR
- Right-click `index.html` in VS Code and select **"Open with Live Server"**.

---

## 🧪 The Three Planned Conflict Scenarios

### Scenario 1: Same-Line Content Conflict (`index.html`)
- **Target:** Line 105 in `index.html`
- **Developer A:** `<h2 class="section-title">Breakfast Favorites</h2>`
- **Developer B:** `<h2 class="section-title">Community Recipe Collection</h2>`
- **Git Result:** `CONFLICT (content): Merge conflict in index.html`
- **Resolution:** Reconciled as `Community Recipe Collection` to encompass both breakfast and dinner contributions.

### Scenario 2: CSS Property Conflict (`css/style.css`)
- **Target:** `.recipe-title` declaration in `css/style.css`
- **Developer A:** `color: #2e7d32;` (Forest Green)
- **Developer B:** `color: #b45309;` (Warm Amber)
- **Git Result:** `CONFLICT (content): Merge conflict in css/style.css`
- **Resolution:** Selected `#2e7d32` for WCAG AA compliance (5.4:1 contrast ratio) and assigned `#b45309` to hover states.

### Scenario 3: Modify vs. Delete Conflict (`recipes/pasta.html`)
- **Target:** File `recipes/pasta.html`
- **Developer A:** Enhanced pasta recipe with ingredients, cooking steps, and emulsion technique.
- **Developer B:** Deleted file (`git rm recipes/pasta.html`) thinking it was an old draft.
- **Git Result:** `CONFLICT (modify/delete): recipes/pasta.html deleted in branch B and modified in HEAD.`
- **Resolution:** Retained Developer A's enhanced file using `git add recipes/pasta.html`.

👉 *Read the full step-by-step terminal commands and conflict marker logs in [`docs/conflict-scenarios.md`](docs/conflict-scenarios.md).*

---

## 🛠️ Reproducing the Conflicts in Git (Exact Commands)

To recreate the exact Git history from scratch:

```bash
# 1. Initialize and commit baseline
git init
git branch -M main
git add .
git commit -m "Initial Team Recipe Book website baseline"

# 2. Create Developer A's branch
git switch -c feature/breakfast-recipes
# (Make Developer A edits: heading in index.html, style in style.css, edit pasta.html)
git add .
git commit -m "Add breakfast collection & style updates"

# 3. Create Developer B's branch from main
git switch main
git switch -c feature/dinner-recipes
# (Make Developer B edits: heading in index.html, style in style.css, git rm recipes/pasta.html)
git add .
git commit -m "Add dinner collection & clean up draft recipes"

# 4. Merge Developer A into main (Clean merge)
git switch main
git merge --no-ff feature/breakfast-recipes -m "Merge branch 'feature/breakfast-recipes'"

# 5. Merge Developer B into main (Trigger Conflicts)
git merge --no-ff feature/dinner-recipes
# Git halts with CONFLICT in index.html, style.css, and pasta.html!

# 6. Resolve and finalize
# Open files, remove conflict markers, choose final lines
git add index.html css/style.css recipes/pasta.html
git commit -m "Resolve merge conflicts across homepage, styles, and pasta recipe"
```

---

## 🌐 GitHub Pull Request Workflow

1. Push both branches to GitHub:
   ```bash
   git push -u origin feature/breakfast-recipes
   git push -u origin feature/dinner-recipes
   ```
2. Open Pull Request #1 (`feature/breakfast-recipes` → `main`) and merge it.
3. Open Pull Request #2 (`feature/dinner-recipes` → `main`).
4. GitHub displays: **"This branch has conflicts that must be resolved"**.
5. Resolve locally or in the GitHub Web Editor, commit the resolution, and merge!

---

## ✅ Final Pre-Submission Checklist

- [x] Homepage and recipe pages open correctly in all browsers
- [x] Navigation links, breadcrumbs, and food images work seamlessly
- [x] Both feature branches (`feature/breakfast-recipes`, `feature/dinner-recipes`) defined
- [x] Developer contributions have distinct commits and authors
- [x] Scenario 1 (Same-line conflict) documented and resolved
- [x] Scenario 2 (CSS property conflict) documented and resolved
- [x] Scenario 3 (Modify/delete conflict) documented and resolved
- [x] Zero leftover conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) in final code
- [x] Pull requests and merge history clearly documented
- [x] Technical report with all 15 sections completed in `docs/project-report.md`
- [x] Website tested across desktop, tablet, and mobile breakpoints
- [x] GitHub Pages static deployment ready

---

## 📅 Seven-Day Project Plan

| Day | Task | Deliverable |
| :---: | :--- | :--- |
| **Day 1** | Git, GitHub, VS Code environment setup & project structure | Starter repository |
| **Day 2** | Build responsive navigation, hero banner & layout tokens | Initial working website |
| **Day 3** | Implement recipe cards, detail pages (`pancakes.html`, `pasta.html`) & CSS | Complete recipe book |
| **Day 4** | Create feature branches (`feature/breakfast-recipes`, `feature/dinner-recipes`) | Parallel team commits |
| **Day 5** | Trigger and resolve all 3 planned conflict scenarios | Clean merge history |
| **Day 6** | Execute GitHub Pull Requests, compile screenshots & documentation | Complete documentation |
| **Day 7** | Deploy to GitHub Pages, conduct final checklist & viva rehearsal | Live project submission |

---

## 🎓 Viva & Technical Interview Q&A

**Q1: What triggers a Git merge conflict?**  
*Answer:* A merge conflict occurs when Git attempts to merge two branches that modified the exact same line of a file differently since their common ancestor, or when one branch modified a file while the other deleted/renamed it.

**Q2: What is the difference between fast-forward and `--no-ff` merge?**  
*Answer:* A fast-forward merge simply moves the branch pointer forward when no divergent commits exist. Using `--no-ff` forces Git to create an explicit merge commit, preserving the historical record that a feature branch existed.

**Q3: How do you resolve a modify/delete conflict?**  
*Answer:* Run `git status` to see the unmerged path. If you choose to keep the file, run `git add <filename>` and commit. If you choose to delete the file, run `git rm <filename>` and commit.

**Q4: How can teams minimize merge conflicts in production?**  
*Answer:* By keeping feature branches small and short-lived, pulling the latest `main` branch frequently, breaking large monolithic files into modular components, and maintaining proactive team communication.

---

## 📜 License
This project is open-source and released under the **MIT License**.
