find_svn_branch () {                                                                                                                                                            
    local localdir=`pwd`                                                                                                                                                        
    local localbase=`basename $localdir`                                                                                                                                        
    local remotedir=""                                                                                                                                                          
    local remotebase=""                                                                                                                                                         
    until [ "$localdir" -ef / ]; do                                                                                                                                             
        if [ -d "$localdir/.svn" ]; then                                                                                                                                        
            remotedir=`svn info|grep URL|awk '{print $2}'`                                                                                                                      
            if [ "$remotedir" != "" ]; then                                                                                                                                     
                remotebase=`basename $remotedir`                                                                                                                                
                if [ "$remotebase" != "$localbase" ]; then                                                                                                                      
                    svn_branch=$remotebase                                                                                                                                      
                    return                                                                                                                                                      
                fi                                                                                                                                                              
                return                                                                                                                                                          
            fi                                                                                                                                                                  
                                                                                                                                                                                
        fi                                                                                                                                                                      
        localdir=`readlink -e "$localdir/../"` # php realpath                                                                                                                   
        localbase=`basename $localdir`                                                                                                                                          
    done                                                                                                                                                                        
    svn_branch=""                                                                                                                                                               
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
