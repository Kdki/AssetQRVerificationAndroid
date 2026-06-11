#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls -ld "$PRG"
    LINK=`expr "$PRG" : '.*->\(.*\)$'`
    if expr "$LINK" : '/.*' > /dev/null; then
        PRG="$LINK"
    else
        PRG=`dirname "$PRG"`"/$LINK"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
} >&2

die () {
    echo
    echo "$*"
    echo
    exit 1
} >&2

# OS specific support (must be 'true' or 'false').
IS_CYGWIN=false
IS_MSYS=false
IS_MINGW=false
case "`uname`" in
  CYGWIN* )
    IS_CYGWIN=true
    ;;
  Darwin* )
    ;;
  MINGW* )
    IS_MINGW=true
    ;;
  MSYS* )
    IS_MSYS=true
    ;;
esac

# Determine the Java command to use in order to create the server Runntime environment.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum file descriptors if we can.
if [ "$IS_CYGWIN" = "true" -o "$IS_MINGW" = "true" ] ; then
    MAX_FD_LIMIT=`getconf ARG_MAX`
    [ $? -eq 0 ] && MAX_FD=$MAX_FD_LIMIT
fi

if [ "$IS_CYGWIN" = "true" ] ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CP="`cygpath --path --mixed "$CLASSPATH"`"
    JAVACMD=`cygpath --unix "$JAVACMD"`
    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    i=0
    for arg in "$@" ; do
        CHECK=`echo "$arg"|egrep -c "^-"`                                 # check if the argument is
        CHECK2=`echo "$arg"|egrep -c "^-.*="`                             # surrounded by quotes in quotes
                                                                   # ("--option=value")
        if [ $CHECK -ne 0 ] && [ $CHECK2 -eq 0 ] ; then                    # unquoted words
            arg="\"$arg\""
        fi
        ARGS="$ARGS $arg"
        i=`expr $i + 1`
    done
    # if we get second arg of --options with nothing on the second arg, java type elevation -java
    # "C:\Program Files\Java\jdk1.8.0_66\bin\java.exe" "-Dorg.gradle.appname=$APP_BASE_NAME" "-Dorg.gradle.launcher.warn_when_idle=true" -classpath "..." org.gradle.launcher.daemon.bootstrap.GradleDaemon "$ARGS"
    # Temurin changed the name on us!
    MAIN_CLASS=org.gradle.wrapper.GradleWrapperMain
    java "${DEFAULT_JVM_OPTS}" \
        "-Dorg.gradle.appname=$APP_BASE_NAME" \
        "-Dorg.gradle.launcher.warn_when_idle=true" \
        -classpath "$CP" \
        $MAIN_CLASS \
        "$@"

else
    JAVACMD=`cygpath --unix "$JAVACMD"`
    # if we get second arg of --options with nothing on the second arg, java type elevation -java
    MAIN_CLASS=org.gradle.wrapper.GradleWrapperMain
    exec "$JAVACMD" "${DEFAULT_JVM_OPTS}" \
        "-Dorg.gradle.appname=$APP_BASE_NAME" \
        "-Dorg.gradle.launcher.warn_when_idle=true" \
        -classpath "$CP" \
        $MAIN_CLASS \
        "$@"
fi
