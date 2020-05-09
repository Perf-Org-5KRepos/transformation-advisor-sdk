FROM ibmcom/websphere-traditional:latest-ubi

# put app and scripts and properties in /work/config
# put external library (e.g db driver) in /work/config/lib
# get from the env.json file [=collectionUnitName]
# get from the sampleData.xml file [=sampleData_xml.ejb\-jar.@version]

COPY --chown=was:root [=metadata_assessmentUnit_json.assessmentUnitName] /work/config/dropins/[=metadata_assessmentUnit_json.assessmentUnitName]
COPY --chown=was:root server.xml /work/config
COPY --chown=was:root ./lib /work/config/lib
RUN /work/configure.sh