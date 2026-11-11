#  SuperGit

**Git. On Steroid.**



> [!NOTE]
> `git` queries its commands in the similar way as `man`'s ( via "git shim") therefore, it is possible to add commands that aren't from git and still get it work using git.

- [Get .rpm](https://github.com/hayamahamed/supergit/releases/download/supergit-latest/supergit.rpm)
- [Get .deb](https://github.com/hayamahamed/supergit/releases/download/supergit-latest/supergit.deb)
- [Get .pkg.tar.zst](https://github.com/hayamahamed/supergit/releases/download/supergit-latest/supergit.pkg.tar.zst)

SuperGit is a tool from scratching my own itch. As I am working on a monorepo, I need to checkout to many commands faster to find differences, attach multiple tags to a same commit, push many tags at once, etc.

## Available Commands

| Command | Purpose |
|---------|---------|
| `supergit` | Shows meta info about supergit |
| `git adc` | Add and commit in a single command |
| `git fastfind` | Interactive, scrollable `git log` with checkout |
| `git multitag` / `git multitag push` | Create or push multiple tags in one command |
| `git nuke` | Generate numerous commits for testing |

---

**1. supergit**

- Shows meta info about supergit.

**2. git adc**
- Stages and commits in one step. The single `-m` flag takes **two** quoted strings: the first is the short commit message, the second (optional) is the long description.

```bash
git adc abc src abc xyz -m "short commit" "long commit"
```
**3. git fastfind** (Largely LLM generated)
  - Opens a scrollable, interactive view of git log. Press Enter to check out the highlighted commit; quit to return to the commit you were on before launching the tool.
```bash
git fastfind
```
<details>
  <summary>fastfind stdout</summary>
  <pre><code>
    
```text
gitout from gitera: Up/Down move, Enter checkout, q quit
(3/24)

   df99770  2026-11-10  feat(ui): add default user icon and desktop layout
   2082295  2026-11-09  fix(ci): add package_all for default in justfile
 * e63ed64  2026-11-09  ci: replace per-package release workflows with one tag-driven workflow for publishing to gh releases
   5823cb7  2026-11-09  feat(ui): add Carbonwarp 12 UI - ClearUI,  as a package
   c6f53f9  2026-11-09  chore: add public.asc
   06a26be  2026-11-09  chore: update .gitignore
   613f70b  2026-11-08  ci(fix): fix typo mistakes that causes pipeline to fail
   a5fb297  2026-11-08  ci: publish carbonwarp-backgrounds as a .rpm to gh releases
   1f5e829  2026-11-08  chore: initial implementation of carbonwarp-backgrounds ( for rpm packaging)
   e994379  2026-11-07  fix(launcher): replace python (runpy) launcher with python shell wrapper
   b03654d  2026-11-06  chore: change to version agnostic package name
   91511fb  2026-11-06  chore: versiom bump to 100.0.0
   56940ca  2026-11-06  feat: UI improve and custom featured feed added
   6b9cd74  2026-11-05  docs: remove unnecessary details and wrong license
   ff1505d  2026-11-03  ci(fix): add private key
   0246b0b  2026-11-03  ci: cw-software to publish rpm on releases
   5fe4a82  2026-11-03  ci: remove nfpm and package version mismatch check
   71ac440  2026-11-03  chore: bump version to v1.1.3
   9a79e70  2026-11-02  ci: filee to publish releases on tag push
   aefc339  2026-11-02  ci: update nfpm to v2.47.0 and downgrade ubuntu to 22.04

Checked out at e63ed64 — ci: replace per-package release workflows with one tag-driven workflow for publishing to gh releases 
commit e63ed64b3280cb8d63c96ddf072b81819b462ef0
Author: Hayam A. <hayam@carbonwarp.com>
Date:   Mon Nov 9 07:56:35 2026 +0530

    ci: replace per-package release workflows with one tag-driven workflow for publishing to gh releases

diff --git a/.github/workflows/carbonwarp-backgrounds.yml b/.github/workflows/carbonwarp-backgrounds.yml
deleted file mode 100644
index f1d5ffa..0000000
--- a/.github/workflows/carbonwarp-backgrounds.yml
+++ /dev/null
@@ -1,76 +0,0 @@
-name: carbonwarp-backgrounds
-
-on:
-  push:
-    tags:
-      - "carbonwarp-backgrounds-v*" # trigger on tag push
-      
-concurrency:
-  group: carbonwarp-backgrounds-${{ github.ref }}
-  # never cancel a running release
-  cancel-in-progress: ${{ !startsWith(github.ref, 'refs/tags/') }}
     .... # It shows the whole diff, but for compact fullness, only a portion's added.
```

  </code></pre>
</details>   

**4. git multitag & git multitag push**

- git multitag      : lets you add multiple tags in a single command (ie. specifically for monorepos)
- git multitag push : lets you push multiple tags at once
```bash
git multitag tag1 tag2 abc xyz
```
```bash
git multitag push tag1 tag4 xyz
```
  
**5. git nuke**
- Create numerous commits for testing purposes (dont think of painting your graph green).
```bash
git nuke
```
```text
How many commits you want? 1000 # any positive integer's accepted
Started 1,2,3...
Half way done...
Completed.
```
