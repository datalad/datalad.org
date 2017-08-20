Title: git-annex-centric benchmark of the filesystems
date: 2015-07-06 21:15
slug: test_fs_analysis

### Problem statement

For the DataLad project we will establish a large number of git-annex
repositories.  Majority of those git-annex repositories will not
contain any data, but rather a lot of empty files and/or broken
symlinks.  Some data sharing projects which we are going to cover
contain thousands and even millions of files (e.g. HCP500 release S3
bucket contained over 5 million files).  Originally, we had a very
nice experience with [ZoL (ZFS on Linux)](http://zfsonlinux.org) on
computational clusters we administer/use.  Its volume management, data
integrity checking, and various features (snapshotting, etc) are very
appealing and served us well before.  So ZFS was a logical choice to
deploy for our DataLad development/storage server(s).  But
unfortunately, during development we ran into complete system stalls
(which thanks to ZoL developers were promptly resolved), and overall
**very** slow performance (even with SSD L2ARC caches and relatively
large RAM on those boxes).  So it became important to investigate if
we were indeed hitting the limits of contemporary conventional
file-system designs while dealing with large number of files, or just
getting bound by ZoL.

#### System setup

All the benchmarks were ran on a recently purchased server

- CPU: Intel(R) Xeon(R) CPU E5-1607 v2 @ 3.00GHz (quad core)
- RAM: 64GB (registered)
- OS: Debian jessie (8.1) amd64 build, with NeuroDebian and ZoL
  repositories enabled
- Kernel: 3.16.7-ckt9-3~deb8u1 (Debian: 3.16.0-4-amd64)
- ZoL/ZFS module: 0.6.4-15-7fec46
- BTRFS tools: originally 3.17 (as in jessie) but then tested a single setup
  initiated with 4.0 tools (backport coming from NeuroDebian repository)
- Drives: 6 Seagate Constellation ES.3 (ST4000NM0033-9ZM170, fw SN04)
  on an LSI SAS3008 HBA

#### Scripts

[test_fs.py](https://github.com/datalad/benchmarking/blob/master/test_fs.py)
script was created to initiate a range of prototypical filesystem
setups, with software raid/MD (redundancy), LVM (volume management)
and various file systems (EXT4, XFS, ZFS, RaiserFS, BTRFS) in various
configurations.  We tested typical operations in the life-time of a
git/annex repository -- creation (only for larger repositories test),
du, chmod, git clone, git annex get, git annex (in)direct, tar etc --
full list is available in results tables below.

### Results

Below we present results of the analysis of collected timings, which
in its entirety is available as
[IPython notebook](https://github.com/datalad/benchmarking/blob/master/test_fs_analysis.ipynb)
with all the necessary data in the repository if you would like to
have an alternative analysis or visualization done since presentation
here is quite messy.

**Overall verdict is**: *we are going for Software Raid (RAID6) + LVM
(scalability) + BTRFS (performance)* as our setup with robust volume
management (snapper tool providing snapshots management) and good
performance (with tolerable impact from enabled compression).  BTRFS
exhibited robust performance across a wide range of meta-information
utilization, while RaiserFS -- the next contender -- failed to scale
(although it may have behaved better with some tune up/options -- we
didn't explore).  ZoL/ZFS quickly became way too slow to be even
properly tested and thus was not considered for our case.  Additional
features of BTRFS, such as COW (copy-on-write) can already be utilized
by git-annex so providing BTRFS additional bonus points in our
decision.  The choice of compression (lzo vs zlib) for BTRFS did not
have a clear winner, and impact from compression was not completely
detrimental (although went up to ~30% on `git clone` operation overall
impact due to compression).

**Disclaimer** YMMV.  We have tested file-systems on quite an obscure
setup, which is very heavy on meta-information without much of actual
data being stored -- lots of tiny files with as many symlinks and
directories (under `.git/annex/objects`).  Though, majority of the
benchmarked commands (e.g., chmod, du) were meta-information access
heavy, so even if large data files were stored we would expect similar
performance in those cases.

**Hint** If you would like to see larger plots, just open images on
separate pages so they would become zoomable in your browser.


{% notebook test_fs_analysis.ipynb cells[16:] %}
