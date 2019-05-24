# README updated

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### Setup
## Git Flow
### DELETE BEFORE SUBMITTING
1. Pull Develop and then Branch -> Feature/
```
git checkout develop
git pull origin master
git pull origin develop
git checkout -b feature/<branch name>
```
2. Code done in FEATURE branches off develop
3. Test in Feature branch.
4. If 3 passes, Merge into Develop.
```
git checkout develop
git merge feature/branch-name
```
5. Test on Develop branch
6. Push into Remote develop
```
git push origin develop
```
7. Create pull request on Github website

