# ServHs - Fun with serverless-haskell!

To get it running, first install the various dependencies,

```
$ yarn
$ stack build
```

And then test it locally with,

```
$ yarn sls invoke entry
```

Here `entry` is the name of our function (under `functions`) in `serverless.yml`, which points to the `ServHs` package and then the `entry` executable. The format of the handlers, when using serverless-haskell, goes `Package.Executable`, as defined in your `.cabal`/`package.yaml` file.
