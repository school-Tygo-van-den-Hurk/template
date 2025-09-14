# Changelog

## v0.12.0 (2025-09-14)

### Features

* added `bump-version` script
([cfc2035](https://github.com/school-Tygo-van-den-Hurk/template/commit/cfc2035327857380fcc1bbc2ca74fe42a2467c74))
* package structure (#70)
([a52db88](https://github.com/school-Tygo-van-den-Hurk/template/commit/a52db8830623a5df0f2a31984ab4acab4c7f53d5)),
closes [#70](https://github.com/school-Tygo-van-den-Hurk/template/issues/70)
* **pre-commit:** enforce file is either empty or ends in new line (#47)
([990584c](https://github.com/school-Tygo-van-den-Hurk/template/commit/990584c875667aa49e6709b7d5ce7e4808afc70f)),
closes [#47](https://github.com/school-Tygo-van-den-Hurk/template/issues/47)
* **ci:** Enforce conventional commits (#45)
([380cd9a](https://github.com/school-Tygo-van-den-Hurk/template/commit/380cd9ac83e7222f5c6af603a026b807e0dd9351)),
closes [#45](https://github.com/school-Tygo-van-den-Hurk/template/issues/45)
[#33](https://github.com/school-Tygo-van-den-Hurk/template/issues/33)
* Added an update-flake-lock workflow (#38)
([309aab6](https://github.com/school-Tygo-van-den-Hurk/template/commit/309aab6d4c2bae313979524aad6fc73ee02d3995)),
closes [#38](https://github.com/school-Tygo-van-den-Hurk/template/issues/38)
* Broke the nix flake github check down into a matrix (#35)
([5e1a7b3](https://github.com/school-Tygo-van-den-Hurk/template/commit/5e1a7b3486d2dc1d8c287fc6b5e7759a02af313d)),
closes [#35](https://github.com/school-Tygo-van-den-Hurk/template/issues/35)
[#31](https://github.com/school-Tygo-van-den-Hurk/template/issues/31)
* Added CI to enforced branch naming (#40)
([4108717](https://github.com/school-Tygo-van-den-Hurk/template/commit/4108717506d28da01523bf111455908817dfdf72)),
closes [#40](https://github.com/school-Tygo-van-den-Hurk/template/issues/40)
* Moved from 'flake-utils' to 'flake-parts' (#34)
([d33fba3](https://github.com/school-Tygo-van-den-Hurk/template/commit/d33fba3566054a77a54c026779b797ac35bc7477)),
closes [#34](https://github.com/school-Tygo-van-den-Hurk/template/issues/34)
[#30](https://github.com/school-Tygo-van-den-Hurk/template/issues/30)
* added release drafter and publisher (#8)
([2384f2f](https://github.com/school-Tygo-van-den-Hurk/template/commit/2384f2fb0a059d92f35fe928fe030c981607a395)),
closes [#8](https://github.com/school-Tygo-van-den-Hurk/template/issues/8)
* more pre commit checks (#7)
([95480d6](https://github.com/school-Tygo-van-den-Hurk/template/commit/95480d66b6fb267a75c6da17d395df75f5c92d71)),
closes [#7](https://github.com/school-Tygo-van-den-Hurk/template/issues/7)
* Added pre-commit enforced branch protection. (#6)
([712c1d6](https://github.com/school-Tygo-van-den-Hurk/template/commit/712c1d6f7f46c702727de668fb4eb111cd7006d8)),
closes [#6](https://github.com/school-Tygo-van-den-Hurk/template/issues/6)
* Added some more pre-commit hooks
([9e4c5e8](https://github.com/school-Tygo-van-den-Hurk/template/commit/9e4c5e814890d244a1baf8ac88cc5db3692e45e6))
* Added a automatic labeler if package-lock.json changes
([154376b](https://github.com/school-Tygo-van-den-Hurk/template/commit/154376bb60eb780a670602457a392453e22f35c2))
* Create CODEOWNERS
([3d99c19](https://github.com/school-Tygo-van-den-Hurk/template/commit/3d99c19ae250c613bc0af7e2fa75587d7952979b))
* Added direnv to the dev container
([548cf54](https://github.com/school-Tygo-van-den-Hurk/template/commit/548cf544c099debf93a30c73c68e2df6086dfac2))
* Added pre-commit hooks integration to check before each push
([fad5d63](https://github.com/school-Tygo-van-den-Hurk/template/commit/fad5d63d37495492d1a891ab6d11e2adb5bc0a6f))
* Added some recommendations
([28a9ff7](https://github.com/school-Tygo-van-den-Hurk/template/commit/28a9ff7507052119018849ba09535cd6be09f037))
* now checking entire file paths for capitalisation
([a01d33d](https://github.com/school-Tygo-van-den-Hurk/template/commit/a01d33dd73ad2c4c61139db8bc8ae2a9108c45d8))
* Added editor config to standardize settings
([6f3eff8](https://github.com/school-Tygo-van-den-Hurk/template/commit/6f3eff8725c616a15a7d2f7c42981f317792864a))
* added workflow that checks for lowercase file extensions
([2229481](https://github.com/school-Tygo-van-den-Hurk/template/commit/222948157c2d857c444460dd43be7ba0f2c28acc))
* Added non-flake compatibility layer
([ee976e5](https://github.com/school-Tygo-van-den-Hurk/template/commit/ee976e5a806b779f89425ffc4693f74e92ab6ac1))
* Added greeting message for new contributors
([5b3ad1d](https://github.com/school-Tygo-van-den-Hurk/template/commit/5b3ad1d9299614ed293eba96ec440b939460ecfa))
* Added treefmt.nix and formatting checks
([25d5760](https://github.com/school-Tygo-van-den-Hurk/template/commit/25d5760f04d68362d117f399f70b50102283decd))
* **ci:** Added dependabot automerge for patch updates
([8d10b07](https://github.com/school-Tygo-van-den-Hurk/template/commit/8d10b074c8e6b99eeeaecac14aebff017dc44a0b))

### Fixes

* removed `ignore_changes` set from '-t/--to` argument
([822e7e0](https://github.com/school-Tygo-van-den-Hurk/template/commit/822e7e0df0bbb918cd7b4fca5b01061e7b5d23ef))
* broken link to '.github/labler.yml'
([1605b70](https://github.com/school-Tygo-van-den-Hurk/template/commit/1605b70d5f945b5085da5a0bbe281836173b360f))
* Saved CI minutes (#43)
([d48e50d](https://github.com/school-Tygo-van-den-Hurk/template/commit/d48e50d27459fe255fd5d2a6ce436c064fedb681)),
closes [#43](https://github.com/school-Tygo-van-den-Hurk/template/issues/43)
* using wrong ref to get branch name and incorrect output (#42)
([ccafdac](https://github.com/school-Tygo-van-den-Hurk/template/commit/ccafdacfe13d4dd4421abfead41eb4e82d27ae31)),
closes [#42](https://github.com/school-Tygo-van-den-Hurk/template/issues/42)
* formatting on releases (#23)
([f8faebf](https://github.com/school-Tygo-van-den-Hurk/template/commit/f8faebf4e43b91daa8e7da4c91b81cf1830d68b4)),
closes [#23](https://github.com/school-Tygo-van-den-Hurk/template/issues/23)
[#20](https://github.com/school-Tygo-van-den-Hurk/template/issues/20)
* no redeploy to github pages on picture change (#22)
([37c05f2](https://github.com/school-Tygo-van-den-Hurk/template/commit/37c05f2747a84040524510a4f2ddda81ac9e63fb)),
closes [#22](https://github.com/school-Tygo-van-den-Hurk/template/issues/22)
* Fixed spamming issue (#19)
([a33ae3b](https://github.com/school-Tygo-van-den-Hurk/template/commit/a33ae3b5fbcd9351a104da6c8c0dc52212de91cc)),
closes [#19](https://github.com/school-Tygo-van-den-Hurk/template/issues/19)
* failing workflow by removed artifact paths
([822507c](https://github.com/school-Tygo-van-den-Hurk/template/commit/822507c08b9ee1f71d92f7aeb73a100407576975))
* Make release workflow also copy nix result directory (#16)
([1424c86](https://github.com/school-Tygo-van-den-Hurk/template/commit/1424c8698c8b6ef101d70c4afd96e0219e62f74b)),
closes [#16](https://github.com/school-Tygo-van-den-Hurk/template/issues/16)
[#14](https://github.com/school-Tygo-van-den-Hurk/template/issues/14)
* Added documentation about ci/cd, pre-commit, devcontainers (#15)
([94036ba](https://github.com/school-Tygo-van-den-Hurk/template/commit/94036ba73c043bc944c6ab293cacf25e0947792f)),
closes [#15](https://github.com/school-Tygo-van-den-Hurk/template/issues/15)
[#11](https://github.com/school-Tygo-van-den-Hurk/template/issues/11)
* missing 'version' env var in a github action workflow (#10)
([855603e](https://github.com/school-Tygo-van-den-Hurk/template/commit/855603e832d3955f928beef903f080449eb3d04c)),
closes [#10](https://github.com/school-Tygo-van-den-Hurk/template/issues/10)
* issues regarding the 'release-drafter' config (#9)
([a583d89](https://github.com/school-Tygo-van-den-Hurk/template/commit/a583d89c4036d1907326b372fb6538808af48b40)),
closes [#9](https://github.com/school-Tygo-van-den-Hurk/template/issues/9)
* Changed markdown checker to mdformat
([0566284](https://github.com/school-Tygo-van-den-Hurk/template/commit/05662842cd3a14fcc2b293da2208613506dea807))
* Added exception in file naming conventions for '.github/CODEOWNERS'
([a4d42e2](https://github.com/school-Tygo-van-den-Hurk/template/commit/a4d42e289d16dc43b6c166c338ebbc6a68caf58d))
* added consistent line endings
([6a6182f](https://github.com/school-Tygo-van-den-Hurk/template/commit/6a6182f35cfddd53db96e69c6a1165b2b514fd1c))
* Added nix results and dir env directories into git ignore list
([757913c](https://github.com/school-Tygo-van-den-Hurk/template/commit/757913c030d751056c039f144ec3066eb8ea79fb))
* automerge with Dependabot
([8effa2c](https://github.com/school-Tygo-van-den-Hurk/template/commit/8effa2c7d8a84f0ecfc19633a8c8425cbdbd1ba0))
