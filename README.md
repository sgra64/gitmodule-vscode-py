<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
# gitmodule-vscode-py
<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

Gitmodule with *.vscode* settings for a Python project.

Check-out *git module* into sub-directory `vscode` in the project directory:

```sh
git submodule add -f -- https://github.com/sgra64/gitmodule-vscode-py.git .vscode

ls -la .vscode              # show content of the new '.vscode' folder
```
```
total 30
drwxr-xr-x 1    0 Oct  5 22:53 ./
drwxr-xr-x 1    0 Oct  5 22:53 ../
-rw-r--r-- 1   32 Oct  5 22:53 .git
-rw-r--r-- 1   23 Oct  5 22:53 .gitignore
-rw-r--r-- 1 1296 Oct  5 22:53 launch.json          <-- Python launch configurations
-rw-r--r-- 1  628 Oct  5 22:53 launch-terminal.sh   <-- terminal launch script
-rw-r--r-- 1 6288 Oct  5 22:53 README.md
-rw-r--r-- 1 3467 Oct  5 22:53 settings.json        <-- VSCode settings file
```

```sh
cd .vscode
git rm README.md && git commit -m "remove README.md"    # remove 'README.md'
cd ..
```

In addition, git has created a `.gitmodules` file in the project directory
and added the gitmodule:

```sh
cat .gitmodules             # show '.gitmodules' file
```

Output shows the new git module registered with the project:

```
[submodule ".vscode"]
        path = .vscode
        url = https://github.com/sgra64/gitmodule-vscode-py.git
```

```sh
git submodule                       # list git submodules registered with the project
git submodule foreach git status    # show status of each registered submodule
```
```
 9b026748f9a7d3356bbaaf8184a4edddfc288bf9 .vscode (heads/main)

Entering '.vscode'
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```


&nbsp;

## File: *settings.json*

File [*settings.json*](settings.json) in a project *.vscode* directory contains
project-specific setting for the *VSCode* IDE.

General settings for *VSCode* (such as *auto-save* or using *UTF-8* encoding and
*LF* line ending) should be stored in the system-wide (or global)
[*settings.json*](https://github.com/sgra64/dotfiles/blob/main/.vscode_global/settings.json)
file that is stored:

- on *Windows* in: `%APPDATA%\Code\User\settings.json`, e.g.
    `C:/Users/<user>/AppData/Roaming/Code/User/settings.json` and

- on *Mac* in: `$HOME/Library/Application\ Support/Code/User/settings.json`.

- on *Linux* in: `$HOME/.config/Code/User/settings.json`

```sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# VSCode global settings file and project caches:
#  - Windows: '%APPDATA%/Code/User' | 'C:/Users/<user>/AppData/Roaming/Code/User'
#  - MacOS:   '~/Library/Application\ Support/Code/User'
#  - Linux:   '$HOME/.config/Code/User/settings.json'
#        +
#        +-- settings.json         ; VSCode global settings file
#        +-- workspaceStorage      ; VSCode project caches
# 
# VSCode installation paths:
#  - Windows: '%APPDATA%/Local/Programs/Microsoft\ VS\ Code/bin'
#  - MacOS:   '/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin'
# 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# VSCode commands:
#  - build: Ctrl-Shift-B
#  - run:   Ctrl-Alt-N
#  - open command panel: Ctrl-Shift-P
#  - block comment: mark text and Ctrl-'#'
#  - multi-cursor edits: Ctrl-Alt-<ArrowUp,Down> or Alt+<Click>
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

See the
[*VSCode Settings documentation*](https://code.visualstudio.com/docs/configure/settings).

Recommended global settings are:

```json
{
    // Python code-runner settings
    "code-runner.defaultLanguage": "python",
    "code-runner.showExecutionMessage": false,
    "code-runner.clearPreviousOutput": true,
    "code-runner.executorMap": {
        // "python": "\"$pythonPath\" $fullFileName",
        "python": "python ./main.py",
    },
    "makefile.configureOnOpen": false,

    // Python test-runner settings, requires module 'pytest'
    // - verify: python -m pytest --version --> 8.4.2
    // - install module 'pytest': pip install pytest
    // 
    "python.testing.unittestEnabled": false,    // or error: Test provider types are not aligned
    "python.testing.pytestEnabled": true,
    "python.testing.autoTestDiscoverOnSaveEnabled": true,
    "python.testing.unittestArgs": [
        "-v", "-s", "${workspaceFolder}/tests", "-p", "test_*.py"
    ],

    // Editor settings
    "editor.detectIndentation": false,
    "editor.tabSize": 4,
    "editor.insertSpaces": true,            // insert spaces for tabs
    "editor.renderWhitespace": "all",       // show white spaces in editor as small dot
    "editor.hover.enabled": true,           // show context when hovering
    "editor.hover.delay": 1500,             // delay hover-time for context pop-ups (in ms)
    "editor.minimap.enabled": false,        // show minimap for long files
    "editor.inlayHints.enabled": "off",     // don't show argument names in method calls
        "files.exclude": {
        "**/__pycache__": true,
        "**/*.pyc": true
    },

    // File settings
    "explorer.confirmDelete": false,        // ask to comfirm file delete
    "files.autoSave": "afterDelay",         // 'afterDelay' (1sec), 'onFocusChange', 'onWindowChange'
    "files.autoSaveDelay": 800,
    "files.eol": "\n",                      // use '\n' as default line ending (not: CR/LF)

    // Terminal settings, see https://code.visualstudio.com/docs/terminal/profiles
    "terminal.integrated.defaultProfile.windows": "Bash",
    "terminal.integrated.profiles.windows": {
        "Bash": {
          "path": ["bash"],
          "args": ["--init-file", "'${workspaceFolder}'/.vscode/launch-terminal.sh"],
        //   "args": ["--init-file", "~/.profile"],
          "icon": "terminal-bash",
        },
        "Git Bash": null,                   // remove other terminals from the menu
        "PowerShell": null,
        "Command Prompt": null,
        "JavaScript Debug Terminal": null,
        "Ubuntu (WSL)": null,
    },
    "terminal.integrated.hideOnStartup": "always"   // prevent terminal show-up on startup
}
```


&nbsp;

## File: *launch.json*

File [*launch.json*](launch.json) stores the *VSCode* launch configurations for the
*"Run and Debug"* pane (Shift+Ctrl+D).
Each entry creates a new launch configuration.

The example shows three Java-launchers: "*Launch_1*", "*Launch_2*" and
*"Launch Chrome"*:

```json
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// VSCode launch configuration for "Run and Debug" pane (Shift+Ctrl+D)
//  - https://code.visualstudio.com/docs/java/java-debugging
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{
    "version": "1.0.0",
    "configurations": [
        {
            "name": "Launch_1",
            "type": "debugpy",
            "request": "launch",
            "program": "${workspaceFolder}/main.py",
            // "module": "${workspaceFolder}/main.py",
            "args": [],
            "console": "integratedTerminal",
            "justMyCode": true,
        }
    ]
}
```


&nbsp;

## File: *launch-terminal.json*

File [*launch-terminal.json*](launch-terminal.json) stores the terminal launch
configuration.
The terminal launch configuration file is executed as `"--init-file"` when
a new terminal is opened in *VSCode* (see the `"Bash"`-terminal configuration
created in [*settings.json*](settings.json)).

The terminal launch configuration typically includes calling *.rc* - files to
create the proper environment for the new terminal *shell* process.

```sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# initialize terminal when launched in VSCode, script is called in settings.json
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# 
# probe terminal is launched on Mac with zsh or with bash otherwise
# source $HOME/.zshrc for zsh (Mac) or $HOME/.bashrc otherwise
type setopt 2>/dev/null | grep builtin >/dev/null
[ $? = 0 ] &&
    source ~/.zshrc ||
    source ~/.bashrc
# 
# on Windows, change code page (chcp, default: 437) to UTF-8 (65001), see:
# https://superuser.com/questions/269818/change-default-code-page-of-windows-console-to-utf-8/269857#269857
type -p chcp.com >/dev/null &&
    chcp.com 65001
# 
# source project when 'env' file is present
for env in "env.sh" ".env/env.sh"; do
    [ -f "$env" ] && builtin source "$env" && break
done
```
