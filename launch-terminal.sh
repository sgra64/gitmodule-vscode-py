# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# initialize terminal when launched in VSCode, script is called in settings.json
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# probe terminal is launched on Mac with zsh or with bash otherwise
# source $HOME/.zshrc for zsh (Mac) or $HOME/.bashrc otherwise
type setopt 2>/dev/null | grep builtin >/dev/null
[ $? = 0 ] &&
    source ~/.zshrc || source ~/.bashrc

# # 
# # on Windows, change code page (chcp, default: 437) to UTF-8 (65001), see:
# # https://superuser.com/questions/269818/change-default-code-page-of-windows-console-to-utf-8/269857#269857
# type -p chcp.com >/dev/null &&
#     chcp.com 65001
# # 
# # source project when 'env' file is present
# for env in "env.sh" ".env/env.sh"; do
#     [ -f "$env" ] && builtin source "$env" && break
# done
