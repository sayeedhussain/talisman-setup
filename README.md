# Talisman setup
- This repo shows how to setup talisman as a pre-commit hook in a repo.
- To setup [talisman](https://github.com/thoughtworks/talisman) as pre-commit hook in any repo, copy the scripts folder to the project root of the repo and run the below command from project root

```bash
./scripts/install-githooks.sh
````

## Doing more things in pre-commit hook

The below code runs gradle check as pre-commit hook if the commit has changes to .java files

```bash
#!/bin/sh

set +e
git diff --name-only --cached | grep -E '.*\.java' > /dev/null
status=$?
set -e
if [ $status -ne 0 ]; then
  exit 0
fi

./gradlew check -x test -x dependencyCheckAnalyze -x dependencyUpdates --dry-run
./gradlew check -x test -x dependencyCheckAnalyze -x dependencyUpdates -x jacocoTestCoverageVerification

status=$?

./gradlew spotlessApply

exit $status
```