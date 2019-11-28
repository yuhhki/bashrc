# ============================
# git command
# ============================

###############################
# gc ${url.git} でgit cloneする
###############################
alias gcl=gcl_set
function gcl_set(){
    git clone $1
}

###############################
# gco ${branch}でgit checkout
#   対象ブランチが見つからなければ新規ブランチを切る
#   引数指定なしでdefault branchをcheckout
###############################
alias gco=gco_set
function gco_set(){
    target=$(git symbolic-ref refs/remotes/origin/HEAD | awk -F'[/]' '{print $NF}')
    if [ -n "${1}" ]; then target=${1}; fi
    git checkout ${target} || git checkout -b ${target}
    git pull
}

###############################
# gpl でgit pullする
###############################
alias gpl=gpl_set
function gpl_set(){
    git pull
}

###############################
# gs でgit statusする
###############################
alias gs=gs_set
function gs_set(){
    git status
}

###############################
# ga ${path} でgit addする
###############################
alias ga=ga_set
function ga_set(){
    git add $1
}

###############################
# gaa でgit add . する
###############################
alias gaa=gaa_set
function gaa_set(){
    git add .
}

###############################
# gcm ${message} でgit commitする
###############################
alias gcm=gcm_set
function gcm_set(){
    git commit -m $1
}

###############################
# gpsで現在のbranchをremoteにgit push する
###############################
alias gps=gps_set
function gps_set(){
    branch_name=$(git symbolic-ref --short HEAD)
    git push origin $branch_name
}

###############################
# gcp でgit commit -m ${commitMessage} or "modify" + git push する
###############################
alias gcp=gcp_set
function gcp_set(){
    msg="modify"
    if [ ${#} -ne 0 ]; then
	msg=${1}
    fi
    git commit -m ${msg}
    branch_name=$(git symbolic-ref --short HEAD)
    git push origin $branch_name
}


###############################
# gacp でgit add. + git commit -m "modify" + git push する
###############################
alias gacp=gacp_set
function gacp_set(){
    msg="modify"
    if [ ${#} -ne 0 ]; then
	msg=${1}
    fi
    git add .
    git commit -m ${msg}
    branch_name=$(git symbolic-ref --short HEAD)
    git push origin $branch_name
}



# ============================
# その他のcommand
# ============================

###############################
# m でmanualを表示する
###############################
alias m=m_set
function m_set(){
    cat ~/.bashrc | egrep '^# '
}

###############################
# e でexitする
###############################
alias e=e_set
function e_set(){
    exit
}

###############################
# ex でexplorer . する
###############################
alias ex=ex_set
function ex_set(){
    explorer .
}

###############################
# tree でtreeが入ってなくてもtreeを表示する
###############################
alias tree=tree_set
function tree_set(){
    pwd; find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'
}

###############################
# l でls -la する
###############################
alias l=l_set
function l_set(){
    ls -la
}

###############################
# refresh でbash_profileを再読み込みする
###############################
alias refresh=refresh_set
function refresh_set(){
    source ~/.bash_profile
}