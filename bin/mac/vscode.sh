#!/usr/bin/env bash

brew_install_cask visual-studio-code

array=$(code --list-extensions)

vscode_install_extension () {
  if ! [[ "${array[*]}" =~ "$1" ]]; then
      code --install-extension $1
  fi
}

#code --install-extension DavidAnson.vscode-markdownlint
#code --install-extension esbenp.prettier-vscode
#code --install-extension formulahendry.docker-explorer
#code --install-extension GrapeCity.gc-excelviewer
#code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
#code --install-extension ria.elastic
#code --install-extension tomoki1207.pdf
code --install-extension ms-python.python
vscode_install_extension humao.rest-client
vscode_install_extension ms-azuretools.vscode-docker
vscode_install_extension yzhang.markdown-all-in-one

tee ~/Library/Application\ Support/Code/User/snippets/bash-file-header.code-snippets <<-'EOF' >/dev/null
{
  "Bash File Header": {
    "prefix": [
      "bash"
    ],
    "body": [
      "#!/usr/bin/env bash"
    ]
  }
}
EOF

tee ~/Library/Application\ Support/Code/User/settings.json <<-'EOF' >/dev/null
{
    "workbench.colorTheme": "Default Light+",
    "git.autofetch": true,
    "terminal.integrated.fontFamily": "Hack Nerd Font",
    "files.autoSave": "afterDelay"
}
EOF

tee ~/Library/Application\ Support/Code/User/keybindings.json <<-'EOF' >/dev/null
[
    {
        "key": "shift+cmd+c",
        "command": "-workbench.action.terminal.openNativeConsole",
        "when": "!terminalFocus"
    },
    {
        "key": "shift+cmd+c",
        "command": "editor.action.toggleColumnSelection"
    },
    {
        "key": "shift+cmd+d",
        "command": "-workbench.view.debug",
        "when": "viewContainer.workbench.view.debug.enabled"
    },
    {
        "key": "shift+cmd+d",
        "command": "editor.action.duplicateSelection"
    }
]
EOF

if brew ls --versions "duti" > /dev/null
then 
  duti -s com.microsoft.VSCode .c all
  duti -s com.microsoft.VSCode .cfg all
  duti -s com.microsoft.VSCode .conf all
  duti -s com.microsoft.VSCode .cpp all
  duti -s com.microsoft.VSCode .cs all
  duti -s com.microsoft.VSCode .css all
  duti -s com.microsoft.VSCode .go all
  duti -s com.microsoft.VSCode .java all
  duti -s com.microsoft.VSCode .js all
  duti -s com.microsoft.VSCode .json all
  duti -s com.microsoft.VSCode .jsx all
  duti -s com.microsoft.VSCode .less all
  duti -s com.microsoft.VSCode .log all
  duti -s com.microsoft.VSCode .lua all
  duti -s com.microsoft.VSCode .md all
  duti -s com.microsoft.VSCode .php all
  duti -s com.microsoft.VSCode .pl all
  duti -s com.microsoft.VSCode .py all
  duti -s com.microsoft.VSCode .rb all
  duti -s com.microsoft.VSCode .sass all
  duti -s com.microsoft.VSCode .scss all
  duti -s com.microsoft.VSCode .toml all
  duti -s com.microsoft.VSCode .ts all
  duti -s com.microsoft.VSCode .tsx all
  duti -s com.microsoft.VSCode .txt all
  duti -s com.microsoft.VSCode .vue all
  duti -s com.microsoft.VSCode .yaml all
  duti -s com.microsoft.VSCode .yml all
  duti -s com.microsoft.VSCode public.data all
  duti -s com.microsoft.VSCode public.json all
  duti -s com.microsoft.VSCode public.plain-text all
  duti -s com.microsoft.VSCode public.python-script all
  duti -s com.microsoft.VSCode public.shell-script all
  duti -s com.microsoft.VSCode public.source-code all
  duti -s com.microsoft.VSCode public.text all
  duti -s com.microsoft.VSCode public.unix-executable all
else 
  echo "duti is missing"
fi
