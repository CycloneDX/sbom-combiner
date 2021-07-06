# sbom-combiner
Lockheed Martin developed utility to combine multiple SBOMs

This application is used to combine two or more Software Bill Of Materials (SBOM) commonly known as SBoms or Boms into a single Bom.
It uses the CycloneDx Schema, and can combine SBoms in either JSon or XML, and output either a JSon or XML Bom.  

## Prerequisites
- Open JDK11
- Apache Maven 3.6.3 or greater installed 
- (Recommended) java IDE Eclipse with Subclipse 4.3.0 plug-in

## Usage:

### Build artifact via maven.
### Maven Command
mvn clean package

### Run
To run as a standalone java application, you can look at the "example.sh" shell script for an example.
You can also use the provided "combine.sh" script as a pass through to the jar.  It assumes all the basic settings.

### Help is available.   
<pre>
    ./combine.sh -h
</pre>

### Help Output shows options for running the SBomCombiner application.
<pre>
usage: help
    -d,     --dir       &lt;arg&gt;   (Optional) directory to get all SBoms from
    -f,     --format    &lt;arg&gt;   (Optional) output file format, Valid values json, xml.  Default is json
    -f1,    --sbom1     &lt;arg&gt;   (Optional) first SBom file
    -f2,    --sbom2     &lt;arg&gt;   (Optional) second SBom file
    -g,     --group     &lt;arg&gt;   (Optional) group name for the upper level Component of the combined SBom
    -h,     --help              will print out the command line options.
    -n,     --name      &lt;arg&gt;   (Optional) name of upper level component of the combined SBom
    -o,     --output    &lt;arg&gt;   (Optional) output file name, default is combine.json or combine.xml
    -t,     --type      &lt;arg&gt;   (Optional) Type of upper level component of the combined SBom.  Valid types are APPLICATION, CONTAINER, DEVICE, FILE, FIRMWARE, FRAMEWORK, LIBRARY, or OPERATING_SYSTEM.  Default value is CONTAINER.
    -v      --version   &lt;arg&gt;   (Optional) Version of the upper level component of the combined SBom.
</pre>

### Running SBomCombiner. 
### In this example it wil combine all files (xml, and json) from the directory ./test into an output.json (also in ./test) bom file.
<pre>
    ./combine.sh -d ./test -o ./test/output -f json
</pre>

### In this example it will combine two files (sbomcommons.json, sbomcomparator.xml) both in the test directory into an ouptut.xml bom file.
<pre>
    ./combine.sh -f1 ./test/sbomcommons.json -f2 ./test/sbomcomparator.xml -o output -f xml
</pre>

### In this example it wil combine all files (xml, and json) from the directory ./test into an output.xml (also in ./test) bom file.  Settings the upper level SBOM metadata Component's group, name, and version.
<pre>
    ./combine.sh -d ./test/ -o ./test/output -f xml -n SBOM -g com.lmco.efoss -v 2.0.3
</pre>

## API:
### You can also pull in the API and run it inside your application.
<pre>
    //sbomFiles is a list of strings that are the SBoms to combine.
    Bom combinedSbom = SBomCombiner.combineSBoms(sbomFiles);
</pre>

## License
[licenses](./LICENSE)
