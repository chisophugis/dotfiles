#!/usr/bin/python
from __future__ import print_function

import os.path
import sys
import subprocess

REPOS = [
    'llvm',
    'llvm/tools/clang',
    'llvm/tools/lld',
    'llvm/projects/compiler-rt',
    'llvm/projects/test-suite',
    'llvm/tools/clang/tools/extra'
]

def main(args):
    if not args:
        print('Empty args list. No command?', file=sys.stderr)
        return 1

    for repo in REPOS:
        print('=' * 36)
        print(repo)
        print('=' * 36)
        if not os.path.exists(repo):
            print('note: {!r} does not exist'.format(repo))
            continue

        output = subprocess.check_output(args, cwd=repo)
        print(output)

    return 0

sys.exit(main(sys.argv[1:]))
