# UTILS
alias tc='top -o cpu'   	 # check cpu usage
alias tm='top -o vsize'		 # check memory usage
alias dud="du -d 1 -h"       # disk usage
alias c="clear"              # clear interface   
alias dc="rm -rf"            # remove folder with content in it
alias h="history"            # review log of commands
alias tgzu="tar -xzvf"       # uzip tar gzip file
alias dl="wget -N"           # download file and overwrite if required
alias dlc="curl -O"          # download file and overwrite if required
alias o="open ."             # open current directory in the finder

# GIT
alias gi="git init"          # create repository
alias gv="git version"       # retrieve the current version of git
alias gs="git status"        # retrieve the status of the workspace
alias ga="git add"           # add a file, must specify the file name after alias
alias gaa="git add ."        # add all files to staging
alias gai="git add -i"       # add files interactively
alias gb="git branch"        # list all current branches
alias gci="git commit -a -m" # add files to staging and commit them 
alias gco="git checkout"     #switch to git branch  
alias gcl="git clone"        #download or checkout a git repo
alias gc="git gc"            # for git garbage collection
alias gcb="git checkout -b"  #create and switch to a git branch
alias gd="git diff"          #create and switch to a git branch
alias gl="git log"           #get commit history without formatting 
alias glm="git log --pretty=\"format:%ad %h (%an): %s\" --date=short"    #medium log
alias gls="git log --pretty=oneline"                                     #log in online formate
alias gr="git reflog"        #Get hidden history
alias gpu="git push"         #push files to remote server
alias gu="git gui &"         #run git gui in the background
alias gk="gitk &"            #run gitk in the background


# SVN
alias ss="svn st -u"                         # svn status of my modified files
alias si="svn info"                          # info about local and remote state
alias su="svn up --ignore-externals"	     # svn update ignore externals
alias sl="svn log --limit"					 # svn log and specify a number to return a specific amount of revisions
alias sco="svn co --ignore-externals"		 # svn checkout and ignore externals
alias sd="svn diff -r"						 # get a diff, pass in i.e.:168:169 index.xml (revisions to compare and file)
alias sci="svn ci -m"                        # svn check in with comment
alias saa="svn add * --force"                # svn add all unrevisioned files 
alias slf="svn log --verbose | grep"         # search svn log for relevant info



# Source Targets
alias ra=". ~/bin/dotfiles/bash/aliases"
alias rc=". ~/bin/dotfiles/bash/config"
alias re=". ~/bin/dotfiles/bash/env"
alias rw="mate -w ~/bin/dotfiles/bash/aliases && ra"



# DIRECTORY
alias ddoc="cd ~/Documents/ && ls -a"
alias dp="cd ~/Documents/Projects/ && ls -a"
alias ds="cd ~/Desktop/svn && ls -a"
alias dsns="cd ~/Desktop/svn/project1 && ls -a"
alias dd="cd ~/Desktop/ && ls -a"
alias db="cd ~/bin/"


# SERVER
alias sl="ssh -p $PORT $USER@$DOMAIN"



# new working directory @ the current level and change into that directory
# example: nwd project
function nwd {
mkdir $1
cd $1
}

#rsync the current path to the specified path -e=.svn -e=.git
#example1:   rsyncd ../syncdir
#example2:   rsyncd ../syncwithoutgitfiledir --exclude=.git
function rsyncd {
CURR_DIR=`pwd`
ADD_PARAMS=$2;
rsync -v -a $ADD_PARAMS $CURR_DIR $1
}

#recursively copy files and list results
#example: cpd ../new/path
function cpd {
CURR_DIR=`pwd`
cp -rv $CURR_DIR $1
}

#move current directory and change into the directory you moved the directory to
#example: mvd ../new/path
function mvd {
CURR_DIR=`pwd`
mv $CURR_DIR $1
cd $1
ls -a
}

#remove the current directory and cd down a level
#example: rmd
function rmd {
CURR_DIR=`pwd`
cd ../
rm -rf $CURR_DIR
ls -a
}

#zip the current directory recursively
#example: zipd archive.zip
#how to unzip: unzip archive.zip
function zipd {
zip -r $1 .
}


#update xml from a server to your current directory 
function uxml {
  dlc https://domainname.com/project/web/xml/file1.xml
  dlc https://domainname.com/project/web/xml/file2.xml
  dlc https://domainname.com/project/web/xml/file3.xml
  dlc https://domainname.com/project/web/xml/file4.xml
}

#tar gzip a file or folder
#example: tgz archive myproject
function tgz {
	tar -czvf $1.tgz $2
}

#find a file type
#example:  ft html
function ft {
find . -name "*."$1 -print
}

#find a file name like this
#example:  f index
function f {
find . -name "*"$1"*" -print
}

#use secure copy to uploaded the current directory 
#example: scpto /web/js
function scpto {
    CURR_DIR=`pwd`
    DOMAIN_PATH=$1
    scp -r $CURR_DIR $USER%$DOMAIN.com@$DOMAIN.com:domains/$DOMAIN_PATH
}


#use rsync copy to sync the current directory 
#example: rsyncto /web/js
function rsyncto {
CURR_DIR=`pwd`
DOMAIN_PATH=$1
ADD_PARAMS=$2
rsync -v -a $ADD_PARAMS $CURR_DIR $USER%$DOMAIN.com@$DOMAIN.com:domains/$DOMAIN_PATH
}

#svn merge theirs full, for when you want all the branches changes in another branch/trunk
#$1 - starting revision, $2 - ending revision, $3 - project, $4 - branch name
#example: smtf 15:30 modules branchname
function smtf {

svn merge -r $1:$2 http://svn/repos/projectname/$3/branches/$4/ . --accept theirs-full --dry-run

}


#update all svn paths for project
#example: sua
function sua {
	echo "------projectname1------"
	cd $SVN_REPO_PATH/projectname1
	svn up --ignore-externals
	echo "------projectname2------"
	cd $SVN_REPO_PATH/projectname2
	svn up
	echo "------projectname3------"
	cd $SVN_REPO_PATH/projectname3
	svn up
	echo "------all repos updated------"
	cd $SVN_REPO_PATH
}


#switch current directory path to branch
#example: sw modules newbranch
function sw {
 svn switch http://svn/repos/projectname/$1/branches/$2/ .
}

#switch development workspace to another branch
#example: swa branchname
function swa {
 echo "------SHELL------"	
 cd  $DEV_PATH/shell/
 svn switch http://svn/repos/projectname/shell/branches/$1/ .
 echo "------MODULES------" 
 cd  $DEV_PATH/modules/
 svn switch http://svn/repos/projectname/modules/branches/$1/ .
 echo "------SHAREDLIBRARIES------"
 cd  $DEV_PATH/sharedlibraries/
 svn switch http://svn/repos/projectname/sharedlibraries/branches/$1/ .
 echo "----All of your development branches have been switched to "  $1  " ----"
 cd  $DEV_PATH
}

#switch development workspace to trunk
#example: swat
function swat {
 echo "------SHELL------"	
 cd  $DEV_PATH/shell/
 svn switch http://svn/repos/projectname/shell/trunk/ .
 echo "------MODULES------" 
 cd  $DEV_PATH/modules/
 svn switch http://svn/repos/projectname/modules/trunk/ .
 echo "------SHAREDLIBRARIES------"
 cd  $DEV_PATH/sharedlibraries/
 svn switch http://svn/repos/projectname/sharedlibraries/trunk/ .
 echo "----All of your development branches have been switched to trunk ----"
 cd  $DEV_PATH
}


#Move a branch to the trunk (delete branch and move branch to trunk without merge considerations to bypass tree conflicts when merge is not actually required only)
#example: sbt modules branchname
function sbt {
 svn del http://svn/repos/projectname/$1/trunk -m "removing trunk to mv branch into trunk for full reintegration"
 svn mv http://svn/repos/projectname/$1/branches/$2 http://svn/repos/projectname/$1/trunk -m "adding branch into trunk for full clone copy without merge considerations"
 echo "------BRANCH:" $2 " MOVED TO TRUNK:" $1"------" 
}

#Commit without using quotes
#example: gcii doing commit without quotes
function gcii {
 git commit -m -v "$*"
}

#List top ten commands
function lt {
 history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

<h3 align="left">Connect with me:</h3>
<p align="left">
<a href="https://twitter.com/node_finder" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="node_finder" height="30" width="40" /></a>
<a href="https://linkedin.com/in/https://www.linkedin.com/in/kenewenemor-ekrika/" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="https://www.linkedin.com/in/kenewenemor-ekrika/" height="30" width="40" /></a>
<a href="https://stackoverflow.com/users/ekrikakenny@gmail.com" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/stack-overflow.svg" alt="ekrikakenny@gmail.com" height="30" width="40" /></a>
</p>
