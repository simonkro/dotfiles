Effortless ctags with git
=========================
from: http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html

Git will use as a template when creating or cloning a repository:
```
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template/hooks
```

Now onto the first hook, which isn’t actually a hook at all, but rather a script the other hooks will call. Place in .git_template/hooks/ctags and mark as executable:

```
#!/bin/sh
rm -f .git/tags
ctags --tag-relative -Rf.git/tags --exclude=.git --languages=-javascript,sql
```

Making this a separate script makes it easy to invoke .git/hooks/ctags for a one-off re-index (or git config --global alias.ctags '!.git/hooks/ctags', then git ctags), as well as easy to edit for that special case repository that needs a different set of options to ctags. For example, I might want to re-enable indexing for JavaScript or SQL files, which I’ve disabled here because I’ve found both to be of limited value and noisy in the warning department.

I stick the tags file in .git because if fugitive.vim is installed, Vim will be configured to look for it there automatically, regardless of your current working directory. Plus, you don’t need to worry about adding it to .gitignore.

Here come the hooks. Mark all four of them executable. Use this same content for the first three: .git/hooks/post-commit, .git/hooks/post-merge, and .git/hooks/post-checkout (actually my post-checkout hook includes hookup as well).

```
#!/bin/sh
.git/hooks/ctags >/dev/null 2>&1 &
```

I’ve forked it into the background so that my Git workflow remains as latency-free as possible.

One more hook that oftentimes gets overlooked: .git/hooks/post-rewrite. This is fired after git commit --amend and git rebase, but the former is already covered by post-commit. Here’s mine:

```
#!/bin/sh
case "$1" in
  rebase) exec .git/hooks/post-merge ;;
esac
```

Once you get this all set up, you can use git init in existing repositories to copy these hooks in.
