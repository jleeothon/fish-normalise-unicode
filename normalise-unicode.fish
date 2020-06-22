function normalise-unicode -d 'Normalise Unicode in files provided using Node'
    set SCRIPT "process.stdin.on('data', (chunk) => { process.stdout.write(chunk.toString().normalize()) })"
    for FILE in $argv
        echo $FILE
        set T (mktemp)
        node -e $SCRIPT <$FILE >$T
        if not diff -q $FILE $T >/dev/null
            cat $T >$FILE
        end
        rm $T
    end
end
