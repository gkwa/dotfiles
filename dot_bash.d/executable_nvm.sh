if [[ $OSTYPE == 'darwin'* ]]; then

    # brew install nvm

    export NVM_DIR="$HOME/.nvm"

    # load nvm:
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"

    # load nvm bash_completion:
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

else
    export NVM_DIR="$HOME/.nvm"

    # load nvm:
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # load nvm bash_completion:
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi
