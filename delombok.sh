#!/bin/bash

set -e
#set -x

mvn package org.projectlombok:lombok-maven-plugin:delombok -DskipTests -Dlombok.verbose=true -Dlombok.addOutputDirectory=false -Dlombok.sourceDirectory=src/main/java

find -name delombok | while read line;
do
cp -r "$line"/* "${line%/target/generated-sources/delombok}/src/main/java/"
done
