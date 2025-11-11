#!/usr/bin/env node

import * as esbuild from 'esbuild'
import path from 'path'
import fs from 'fs'

const watchDirectories = ['./app/javascript', './app/assets/stylesheets']

let ctx = await esbuild.context({
  absWorkingDir: process.cwd(),
  bundle: true,
  entryPoints: ['app/javascript/entrypoints/application.js'],
  outdir: path.join(process.cwd(), 'app/assets/builds'),
  outbase: path.join(process.cwd(), 'app/javascript'),
  external: ['*.png', '*.gif', '*.jpg', '*.jpeg', '*.svg'],
  loader: {
    '.js': 'jsx',
    '.jsx': 'jsx'
  },
  publicPath: '/assets',
  sourcemap: process.env.NODE_ENV !== 'production',
  target: ['es2022'],
  plugins: [
    {
      name: 'watch-plugin',
      setup(build) {
        build.onStart(() => {
          console.log('[esbuild] build started')
        })
        build.onEnd(() => {
          console.log('[esbuild] build finished')
        })
      }
    }
  ]
})

if (process.env.WATCH === 'true') {
  await ctx.watch()
  console.log('[esbuild] watching for changes...')
} else {
  await ctx.rebuild()
  await ctx.dispose()
}

