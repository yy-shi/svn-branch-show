# svn-branch-show
show svn branch name in terminal
在终端显示svn分支名称

# Directions for use 使用说明

put the shell script append the file  ~/.bashrc or ~/.bash_profile
把以下内容放到 ~/.bashrc 或者 ～/.bash_profile文件 末端

```shell
find_svn_branch () {                                                                                                                                                            
    local localdir=`pwd`                                                                                                                                                        
    local localbase=`basename $localdir`                                                                                                                                        
    local remotedir=""                                                                                                                                                          
    local remotebase=""                                                                                                                                                         
          svn_branch=""                                                                                                                                                         
    until [ "$localdir" -ef / ]; do                                                                                                                                             
        if [ -d "$localdir/.svn" ]; then                                                                                                                                        
            remotedir=`svn info $localdir|grep URL|awk '{print $2}'`                                                                                                            
            if [ "$remotedir" != "" ]; then                                                                                                                                     
                remotebase=`basename $remotedir`                                                                                                                                
                svn_branch=$remotebase                                                                                                                                          
                if [ "$remotebase" != "$localbase" ]; then                                                                                                                      
                    return                                                                                                                                                      
                fi                                                                                                                                                              
            fi                                                                                                                                                                  
                                                                                                                                                                                
        fi                                                                                                                                                                      
        localdir=`readlink -e "$localdir/../"` # php realpath                                                                                                                   
        localbase=`basename $localdir`                                                                                                                                          
    done                                                                                                                                                                        
}                                                                                                                                                                                      
PROMPT_COMMAND="find_svn_branch;$PROMPT_COMMAND"   
black=$'\[\e[1;30m\]'                                                                                                                                                          
    red=$'\[\e[1;31m\]'                                                                                                                                                         
  green=$'\[\e[1;32m\]'                                                                                                                                                         
 yellow=$'\[\e[1;33m\]'                                                                                                                                                         
   blue=$'\[\e[1;34m\]'                                                                                                                                                         
magenta=$'\[\e[1;35m\]'                                                                                                                                                         
   cyan=$'\[\e[1;36m\]'                                                                                                                                                         
  white=$'\[\e[1;37m\]'                                                                                                                                                         
 normal=$'\[\e[m\]'                                                                                                                                                             
export TERM=xterm-256color                                                                                                                                                      
PS1="$normal[$blue\u@$magenta\h$white:$cyan\w$yellow\$svn_branch$white]\$ $normal"  
```


![](https://github.com/yy-shi/svn-branch-show/blob/master/5C6FD865-B74C-42CB-9BD0-DDB3E64807C2.png)

