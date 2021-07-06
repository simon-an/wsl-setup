
#!/bin/bash
if [ -n "$WINDOWS_HOME" ]; then
    TARGET_DIR="wsl-backup-$(date +%Y-%m-%d)"
    mkdir $WINDOWS_HOME/$TARGET_DIR
    TARGET=$WINDOWS_HOME/$TARGET_DIR
    SOURCE=~
    cp -v $SOURCE/.profile $TARGET
    cp -v $SOURCE/.aliase $TARGET
    cp -v $SOURCE/.variables $TARGET
    cp -v $SOURCE/.zsh_history $TARGET
else 
    echo "variable WINDOWS_HOME not defined"
fi