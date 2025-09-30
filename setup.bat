@echo off
:: 🚀 LeetCode Activity Setup Script for Windows
:: This script helps you set up your personal workspace for the collaborative activity

echo 🎯 Welcome to LeetCode Collaborative Problem-Solving Activity!
echo ==================================================

:: Get user name
set /p YOUR_NAME="👤 Enter your name (use lowercase with dashes, e.g., 'somchai-dev'): "

:: Basic validation (Windows batch is limited for regex)
if "%YOUR_NAME%"=="" (
    echo ❌ Error: Name cannot be empty
    pause
    exit /b 1
)

:: Check current branch
for /f "tokens=*" %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i

if "%CURRENT_BRANCH%"=="feature/%YOUR_NAME%" (
    echo ✅ Already on branch feature/%YOUR_NAME%
) else (
    echo 🔀 Creating and switching to branch: feature/%YOUR_NAME%
    git checkout -b feature/%YOUR_NAME%
    if errorlevel 1 (
        echo ❌ Failed to create branch. Make sure you have a clean working directory.
        pause
        exit /b 1
    )
)

:: Check if directory exists
if exist "%YOUR_NAME%" (
    echo ⚠️  Directory %YOUR_NAME% already exists. Skipping creation.
) else (
    echo 📁 Creating personal directory: %YOUR_NAME%
    mkdir "%YOUR_NAME%"
)

:: Copy solution files
echo 📋 Copying solution files to your workspace...
if not exist "solutions\section1.cpp" (
    echo ❌ Error: solutions\section1.cpp not found
    pause
    exit /b 1
)
if not exist "solutions\section2.py" (
    echo ❌ Error: solutions\section2.py not found
    pause
    exit /b 1
)

copy "solutions\section1.cpp" "%YOUR_NAME%\"
copy "solutions\section2.py" "%YOUR_NAME%\"

:: Create personal README if it doesn't exist
if not exist "%YOUR_NAME%\README.md" (
    echo 📝 Creating personal README.md...
    (
        echo # %YOUR_NAME%'s Learning Journey
        echo.
        echo ^> **Activity Date**: %date%  
        echo ^> **Branch**: feature/%YOUR_NAME%
        echo.
        echo ## 🎯 Problems to Solve
        echo.
        echo ### ✅ Progress Checklist
        echo - [ ] **Two Sum Problem** ^(section1.cpp^)
        echo   - [ ] Found and fixed Bug 1
        echo   - [ ] Found and fixed Bug 2  
        echo   - [ ] Found and fixed Bug 3
        echo   - [ ] All test cases pass
        echo.  
        echo - [ ] **Median of Two Sorted Arrays** ^(section2.py^)
        echo   - [ ] Found and fixed Bug 1
        echo   - [ ] Found and fixed Bug 2
        echo   - [ ] Found and fixed Bug 3
        echo   - [ ] All test cases pass
        echo.
        echo ## 🐛 Bugs Found ^& Fixed
        echo.
        echo ### Two Sum Problem
        echo 1. **Bug 1**: [Describe the bug you found]
        echo    - **Fix**: [Describe how you fixed it]
        echo.   
        echo 2. **Bug 2**: [Describe the bug you found]
        echo    - **Fix**: [Describe how you fixed it]
        echo.   
        echo 3. **Bug 3**: [Describe the bug you found]
        echo    - **Fix**: [Describe how you fixed it]
        echo.
        echo ### Median of Sorted Arrays  
        echo 1. **Bug 1**: [Describe the bug you found]
        echo    - **Fix**: [Describe how you fixed it]
        echo.   
        echo 2. **Bug 2**: [Describe the bug you found]
        echo    - **Fix**: [Describe how you fixed it]
        echo.   
        echo 3. **Bug 3**: [Describe the bug you found]
        echo    - **Fix**: [Describe how you fixed it]
        echo.
        echo ## 📚 Learning Reflection
        echo.
        echo ### 🎓 Critical Thinking
        echo - **What I learned**: [Your insights about problem analysis]
        echo - **Challenges faced**: [Difficulties in understanding problems]
        echo.
        echo ### 🛠️ Problem Solving
        echo - **Debugging process**: [How you approached finding bugs]
        echo - **Solution strategies**: [Different approaches you considered]
        echo.
        echo ### 🤝 Collaboration ^& Communication  
        echo - **Best feedback received**: [Helpful comments from peers]
        echo - **Most useful review I gave**: [How you helped others]
        echo.
        echo ### 📖 Lifelong Learning
        echo - **Key takeaways**: [What you'll remember from this activity]
        echo - **Future goals**: [Skills you want to develop next]
        echo.
        echo ## 🏆 Achievements
        echo - [ ] Successfully debugged all problems
        echo - [ ] Provided constructive peer feedback  
        echo - [ ] Received helpful code reviews
        echo - [ ] Completed reflection documentation
        echo.
        echo ## 🤝 Collaboration Notes
        echo.
        echo ### Peer Reviews Given:
        echo - **To [Name]**: [Brief note about feedback provided]
        echo - **To [Name]**: [Brief note about feedback provided]
        echo.
        echo ### Feedback Received:
        echo - **From [Name]**: [Brief note about helpful feedback]
        echo - **From [Name]**: [Brief note about helpful feedback]
        echo.
        echo ---
        echo *Generated by setup script on %date%*
    ) > "%YOUR_NAME%\README.md"
    echo ✅ Personal README.md created with templates
) else (
    echo ℹ️  Personal README.md already exists, keeping current version
)

:: Initial commit
echo 💾 Creating initial commit...
git add "%YOUR_NAME%\"
git status

:: Commit changes
git commit -m "Initial setup: Create personal workspace for %YOUR_NAME%" -m "- Created branch feature/%YOUR_NAME%" -m "- Set up personal directory with solution templates" -m "- Added structured README.md for learning documentation" -m "- Ready for LeetCode problem-solving activity"

if errorlevel 1 (
    echo ℹ️  No changes to commit ^(files may already be committed^)
) else (
    echo 🚀 Pushing to remote repository...
    git push -u origin feature/%YOUR_NAME%
    
    if errorlevel 1 (
        echo ⚠️  Push failed. You may need to set up remote repository first.
    ) else (
        echo ✅ Successfully pushed to remote!
    )
)

echo.
echo 🎉 Setup Complete! Here's what you can do next:
echo ==================================================
echo 1. 📖 Read the problems in docs\idea.md
echo 2. 🔍 Analyze the buggy solutions in your %YOUR_NAME%\ folder
echo 3. 🐛 Find and fix the 3 bugs in each solution
echo 4. ✅ Test your fixes with the provided test cases
echo 5. 💾 Commit your changes: git add %YOUR_NAME%\ ^&^& git commit -m "Fix: [description]"
echo 6. 📤 Push and create Pull Request for peer review
echo.
echo 📁 Your workspace: .\%YOUR_NAME%\
echo 🔗 Your branch: feature/%YOUR_NAME%
echo 📝 Document your learning in: %YOUR_NAME%\README.md
echo.
echo Happy coding! 🚀
pause