# Homebrew formulae for some internal OpenTable tools

To access these formulae, you need to

    $ brew tap opentable/osx-tools

If you prefer to use Git over SSH (recommended if you have 2-factor auth turned on), use this instead:

    $ brew tap opentable/osx-tools git@github.com:opentable/homebrew-osx-tools

If you no longer want to use this tap:

    $ brew untap opentable/osx-tools

# Updating the version of Sous

To update which version of Sous is installed by the sous.rb formula,
use the following command:

```shell
./scripts/update_sous.rb $VERSION
```

Replacing $VERSION with whatever version you want. This will update the sous.rb formula,
which you'll then want to commit an push.

