## Git Workflow

If you use git, you might've already seen [a successful git branching model](http://nvie.com/posts/a-successful-git-branching-model/). Counter argument to that can be seen at [model considered harmful](https://barro.github.io/2016/02/a-succesful-git-branching-model-considered-harmful/). For a smaller startup team of say 5 (or code is split into smaller repositories), and releases happening every week, I thought I will share the model that has worked well for me for a while. 

Following simple rules are followed.

1. master branch is always deployed in production
2. for each release, make a branch from master; work on it and push. Before deployment, merge back to master and take a build from master to deploy.

*Caveat* is that if you want to withhold a release after merging into master and in between a hotfix is needed, you are in soup. You can handle this by tagging a release that is in production or creating a branch for production *after* it was deployed. Remember - this is for small teams who want to turn out things fast and not as a research paper on version control!

Rest of this writeup is in the form of `git` command line invocations to get to the desired results; so that most of the things are easily available for copy-paste later. Assume that code editor is `vi` in these examples. Also, the prefix _RC_ is used to indicate release candidate in branch names; and _HF_ is for hot fixes.

### Setup Repo and Working Directory
The example below assumes repository is local; naturally, in a team environment, this will be in a shared area or github or some other place. Change the `git clone` command accordingly. 
```sh
mkdir repo
cd repo
git init --bare
# Clone
cd ..
mkdir wd1
cd wd1
git clone ../repo .
```

### Add a file into master
```sh
vi hello.py
git add hello.py
git commit -m "Initial version"
git push
```
Let us assume that it is deployed now.

### Next release - RC01
This one below is quite nice to keep pushing to whatever is the current branch.
```sh
git config --global push.default current
```
Now, make a branch RC01, make some changes and push it back.

```sh
git checkout -b RC01
vi hello.py
git add hello.py
git commit -m "RC01 version"
git push
```
Let us assume that this has no defects and it can be deployed. For that we will merge to _master_ branch.
```sh
git checkout master
git pull origin master
git merge RC01
git push origin master
```
Assume _master_ is deployed now.

### Next release - RC02
```sh
git checkout -b RC02
vi hello.py
git add hello.py
git commit -m "RC02 version"
git push
```

### Bug in production - HF01!
Before _RC02_ can go to production, some one found a defect in production. We need to patch it immediately. Let us checkout _master_ as a hot fix branch, _HF01_, fix, merge back to _master_ and deploy.
```sh
git checkout master
git checkout -b HF01
# fix code in HF branch
vi hello.py
git add hello.py
git commit -m "HF01 version"
git push
# Merge HF01 to master
git checkout master
git pull origin master
git merge HF01
git push origin master
```
Phew! _HF01_ is deployed. And _RC02_ is also ready to go; and we don't want _HF01_ to be overwritten by _RC02_...

### Get RC02 to production
```sh
git checkout master
git pull origin master
git merge RC02
# fix conflicts and merge. I like meld as a merge tool, so doing one time setup to use that
# below
git config --global merge.tool meld
git mergetool
rm -f *.orig
git add .
git commit -m "Merged"
git push origin master
```
Now, let us see how our branches look like. This command below prints a nice tree; or you can use any of the graphical tools for `git`.
```sh
git log --graph --oneline --all
```

```
 *   961e7a0 Merged RC
 |\  
 | * a3da22d RC02 version
 * | 85f8613 HF01 version
 |/  
 * 0846374 RC01
 * d1beac6 Initial version
```
### Longer Release Work - RC03
Let us work on a longer release, _RC03_. Let us also assume that while we are working on that, we had to deploy two hot fixes, viz., _HF03_ and _HF04_. Yeah, I skipped _HF02_ to make sure you are paying attention :)

```sh
git checkout -b RC03
vi util.py #new file
git add util.py
git commit -m "New util.py added"
git push
```
Oh oh, new HF needed. We will skip HF02 and jump to HF03!
```sh
git checkout master
git checkout -b HF03
vi hello.py
git add hello.py
git commit -m "HF03 Fixed"
git push
```
While _HF03_ is getting tested, we found an even more critical and simpler fix in production, ie _master_. Fix that now!
```sh
git checkout master
git checkout -b HF04
vi hello.py
git add hello.py
git commit -m "HF04 Fixed"
git push
```

HF04 is deployed in prod, so let us merge it to _master_

```sh
git checkout master
git pull origin master
git merge HF04
git push origin master
```

Now _HF03_ is also tested, let us merge that to _master_ and deploy.

```sh
git checkout master
git pull origin master
git merge HF04 # this will conflict. So merge tool.
git mergetool
rm -f *.orig
git add hello.py
git  commit -m "Merged HF03"
git push origin master
```

So, how does our tree look now?
```sh
git log --graph --oneline --all
```
Getting more complex!
```
 *   0d5cea5 Merged HF03
 |\  
 | * 8f6cdf5 HF03 fixed
 * | e847d0b HF04 fixed
 |/  
 | * 5334b0f New util.py added
 |/  
 *   961e7a0 Merged RC
 |\  
 | * a3da22d RC02 version
 * | 85f8613 HF01 version
 |/  
 * 0846374 RC01
 * d1beac6 Initial version
```

### Release RC03!
```sh
git checkout master
git pull origin master
git merge RC03
git push origin master
```

Results in a tree like below.
```
 *   e1e384d Merge branch 'RC03'
 |\  
 | * 5334b0f New util.py added
 * |   0d5cea5 Merged HF03
 |\ \  
 | * | 8f6cdf5 HF03 fixed
 | |/  
 * | e847d0b HF04 fixed
 |/  
 *   961e7a0 Merged RC
 |\  
 | * a3da22d RC02 version
 * | 85f8613 HF01 version
 |/  
 * 0846374 RC01
 * d1beac6 Initial version
```

If you like tags, here is how you can tag the current release as Release_03.
```sh
git checkout master
git tag Release_03 master
git push origin Release_03
```
