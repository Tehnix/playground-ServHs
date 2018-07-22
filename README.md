# ServHs - Fun with serverless-haskell!

To get it running, first install the various dependencies,

```bash
$ yarn
```

And then test it locally with,

```bash
$ yarn sls invoke local --function entry
```

Here, `entry` is the name of our function (under `functions`) in `serverless.yml`, which points to the `ServHs` package and then the `entry` executable. The format of the handlers, when using serverless-haskell, goes `Package.Executable`, as defined in your `.cabal`/`package.yaml` file.

If you want to use the API Gateway, `serverless-haskell` also supports `serverless-offline`. You can try it out by running,

```bash
$ yarn sls offline start
```

and then hit the endpoint with,

```bash
$ curl localhost:3000/hello/john
```

Note that `serverless-haskell` will take care of building your project with stack everytime you invoke any of the above functions.

Finally, to deploy your serverless setup, you run,

```bash
$ yarn sls deploy
```

And `yarn sls remove` to tear it down again, if you are just testing.

### FAQ

**Q:** `yarn sls invoke local -f entry` and `yarn sls offline start` crashes after some time, with `Error: socket hang up`.

**A:** This is caused by some issues with Node version 10.7.0 and there about. You should set your node version to 8.10.0, via e.g. something like nodenv (there's a `.node-version` file that does this automatically for you, if you have nodenv). See https://github.com/seek-oss/serverless-haskell/issues/62 for more.
