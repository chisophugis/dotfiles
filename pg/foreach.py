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
    for repo in REPOS:
        print('=' * 36)
        print(repo)
        print('=' * 36)
        if not os.path.exists(repo):
            print('note: {!r} does not exist'.format(repo))
            continue

        output = subprocess.check_output(args, cwd=repo)
        print(output)

main(sys.argv[1:])
