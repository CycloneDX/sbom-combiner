#!/bin/bash
# Example will compare two Sboms, file 1 (-f1) OrgSbom.xml to file 2 (-f2) ModifiedSbom.xml and produce output file (-o) output in a test directory in the xml format (-f). Will additionally produce html output file (-t). 
# ./compare.sh -f1 ./test/OrgSbom.xml -f2 ./test/ModifiedSbom.xml -o ./test/output -f xml -t ./test/quickOutput
# NOTE: This script was also known as "combine.sh" in earlier documentation.

if [ -z "$JAVA_HOME" ]
then
	echo "\$JAVA_HOME is empty, trying to set it now."
	# Wild guess:
	JAVA_HOME="$(pwd)/jdk-11"
	CLASSPATH="$JAVA_HOME"
	PATH="/bin:/usr/bin:${JAVA_HOME}/bin"
	export JAVA_HOME CLASSPATH PATH
else
	echo "\$JAVA_HOME is already set."
fi

echo "JAVA_HOME=${JAVA_HOME}"
cd "$(dirname "$0")" || exit
ls -la ./target/sbomcomparator-[0-9].[0-9].[0-9].jar || mvn compile || exit

"$JAVA_HOME/bin/java" -Xms256m -Xmx2048m -Dlog4j.configuration=file:./logging/log4j.xml -jar ./target/sbomcomparator-[0-9].[0-9].[0-9].jar "$@"
