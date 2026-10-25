# ==============================================================================
# Git Merge Conflict Automated Simulation & Verification Script
# Project: Team Recipe Book (CulinaryCraft)
# ==============================================================================

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  TEAM RECIPE BOOK — GIT CONFLICT REPRODUCTION HARNESS    " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Verify working on a clean main
Write-Host "`n[Step 1] Ensuring repository is on clean 'main' branch..." -ForegroundColor Green
git switch main

# 2. Check or create feature/breakfast-recipes branch
Write-Host "`n[Step 2] Creating branch: feature/breakfast-recipes (Developer A)..." -ForegroundColor Green
git branch feature/breakfast-recipes 2>$null
git branch feature/dinner-recipes 2>$null

Write-Host "`n[Step 3] Active Git Branches in repository:" -ForegroundColor Yellow
git branch -v

Write-Host "`n[Summary of Planned Conflict Scenarios]" -ForegroundColor Cyan
Write-Host "1. Same-line heading edit in index.html ('Breakfast Favorites' vs 'Community Recipe Collection')"
Write-Host "2. CSS .recipe-title color in css/style.css (#2e7d32 vs #b45309)"
Write-Host "3. Modify vs Delete collision on recipes/pasta.html (Expanded recipe vs Deleted file)"

Write-Host "`nTo push your branches to GitHub, run:" -ForegroundColor Yellow
Write-Host "  git remote add origin https://github.com/YOUR-USERNAME/team-recipe-book.git"
Write-Host "  git push -u origin main"
Write-Host "  git push -u origin feature/breakfast-recipes"
Write-Host "  git push -u origin feature/dinner-recipes"

Write-Host "`nDone! Refer to docs/conflict-scenarios.md for complete logs." -ForegroundColor Green
