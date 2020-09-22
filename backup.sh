
#!/bin/bash
if [ -n "$WINDOWS_HOME" ]; then
    TARGET_DIR="wsl-backup-$(date +%Y-%m-%d)"
    mkdir $WINDOWS_HOME/$TARGET_DIR
    TARGET=$WINDOWS_HOME/$TARGET_DIR
    SOURCE=~
    cp -v $SOURCE/TOKEN.txt $TARGET
    cp -v $SOURCE/.profile $TARGET
    cp -vr $SOURCE/.gnupg $TARGET/.gnupg
    cp -v $SOURCE/.git-credentials $TARGET
    cp -v $SOURCE/.zsh_history $TARGET
else 
    echo "variable WINDOWS_HOME not defined"
fi