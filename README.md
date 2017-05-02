# Deprecated; DO NOT DELETE

New public OpenTable homebrew formula can now be found a
https://github.com/opentable/homebrew-public.

**Please remove this tap using `brew untap opentable/osx-tools` thank you!**

Do not delete this repo; it contains migrations that we should maintain for now.
See `tap_migrations.json`.

## sous

The sous formula is now hosted at [opentable/public/sous] please run
`brew uninstall opentable/osx-tools/sous` to remove the old version,
then `brew tap opentable/public` and finally `brew install opentable/public/sous`
to ensure you continue receiving updates to sous via `brew update` and `brew upgrade`.

## discover

The discover formula is old and no longer maintained here, but left in place
in case anyone is using it. We will eventually update and migrate that formula too.
