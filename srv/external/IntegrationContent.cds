/* checksum : 1600326a6877f3fb17cf79d832fbbe62 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
service IntegrationContent {
  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationDesigntimeArtifacts {
    key Id : String not null;
    key Version : String not null;
    PackageId : String;
    Name : String;
    Description : String;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Configurations : Association to many Configurations {  };
    Resources : Association to many Resources {  };
    DesignGuidelineExecutionResults : Association to many DesignGuidelineExecutionResults {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity RuntimeArtifactErrorInformations {
    key Id : String not null;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationRuntimeArtifacts {
    key Id : String not null;
    Version : String;
    Name : String;
    Type : String;
    DeployedBy : String;
    @odata.Type : 'Edm.DateTime'
    DeployedOn : DateTime;
    Status : String;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    ErrorInformation : Association to RuntimeArtifactErrorInformations {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Configurations {
    key ParameterKey : String not null;
    ParameterValue : String;
    DataType : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Resources {
    key Name : String not null;
    key ResourceType : String not null;
    ReferencedResourceType : String;
    ResourceContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Capabilities.SelectSupport.Supported : false
  entity IntegrationPackages {
    key Id : String not null;
    Name : String not null;
    ResourceId : String not null;
    Description : String;
    ShortText : String not null;
    Version : String;
    Vendor : String;
    PartnerContent : Boolean;
    UpdateAvailable : Boolean;
    Mode : String;
    SupportedPlatform : String;
    ModifiedBy : String;
    CreationDate : String;
    ModifiedDate : String;
    CreatedBy : String;
    Products : String;
    Keywords : String;
    Countries : String;
    Industries : String;
    LineOfBusiness : String;
    PackageContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    IntegrationDesigntimeArtifacts : Association to many IntegrationDesigntimeArtifacts {  };
    ValueMappingDesigntimeArtifacts : Association to many ValueMappingDesigntimeArtifacts {  };
    MessageMappingDesigntimeArtifacts : Association to many MessageMappingDesigntimeArtifacts {  };
    DataTypeDesigntimeArtifacts : Association to many DataTypeDesigntimeArtifacts {  };
    MessageTypeDesigntimeArtifacts : Association to many MessageTypeDesigntimeArtifacts {  };
    FaultMessageTypeDesigntimeArtifacts : Association to many FaultMessageTypeDesigntimeArtifacts {  };
    CustomTags : Association to many CustomTags {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ServiceEndpoints {
    key Id : String not null;
    Name : String;
    Title : String not null;
    Version : String not null;
    Summary : String not null;
    Description : String not null;
    @odata.Type : 'Edm.DateTime'
    LastUpdated : DateTime;
    Protocol : String;
    EntryPoints : Association to many EntryPoints {  };
    ApiDefinitions : Association to many APIDefinitions {  };
    CustomTags : Association to many CustomTags {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity EntryPoints {
    key Url : String not null;
    Name : String not null;
    Type : String;
    AdditionalInformation : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity APIDefinitions {
    key Url : String not null;
    Name : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ValueMappingDesigntimeArtifacts {
    key Id : String not null;
    key Version : String not null;
    PackageId : String not null;
    Name : String not null;
    Description : String;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    ValMapSchema : Association to many ValMapSchema {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ValMaps {
    key Id : String not null;
    Value : Value not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DefaultValMaps {
    key Id : String not null;
    Value : Value not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ValMapSchema {
    key SrcAgency : String not null;
    key SrcId : String not null;
    key TgtAgency : String not null;
    key TgtId : String not null;
    State : String;
    ValMaps : Association to many ValMaps {  };
    DefaultValMaps : Association to many DefaultValMaps {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationAdapterDesigntimeArtifacts {
    key Id : String not null;
    Version : String not null;
    PackageId : String;
    Name : String;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CustomTags {
    key Name : String not null;
    Value : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CustomTagConfigurations {
    key Id : String not null;
    CustomTagsConfigurationContent : String;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DataStores {
    key DataStoreName : String not null;
    key IntegrationFlow : String not null;
    key Type : String not null;
    Visibility : String;
    NumberOfMessages : Integer64;
    NumberOfOverdueMessages : Integer64;
    Entries : Association to many DataStoreEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DataStoreEntries {
    key Id : String not null;
    key DataStoreName : String not null;
    key IntegrationFlow : String not null;
    key Type : String not null;
    Status : String;
    MessageId : String;
    @odata.Type : 'Edm.DateTime'
    DueAt : DateTime;
    @odata.Type : 'Edm.DateTime'
    CreatedAt : DateTime;
    @odata.Type : 'Edm.DateTime'
    RetainUntil : DateTime;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Variables {
    key VariableName : String not null;
    key IntegrationFlow : String not null;
    Visibility : String;
    @odata.Type : 'Edm.DateTime'
    UpdatedAt : DateTime;
    @odata.Type : 'Edm.DateTime'
    RetainUntil : DateTime;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageMappingDesigntimeArtifacts {
    key Id : String not null;
    key Version : String not null;
    PackageId : String not null;
    Name : String not null;
    Description : String;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Resources : Association to many Resources {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationDesigntimeLocks {
    key ResourceId : String not null;
    ArtifactId : String not null;
    ArtifactName : String;
    ArtifactType : String;
    PackageId : String;
    PackageName : String;
    @odata.Type : 'Edm.DateTime'
    CreatedAt : DateTime;
    CreatedBy : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity BuildAndDeployStatus {
    key TaskId : String not null;
    Status : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MDIDeltaToken {
    key Operation : String not null;
    key Entity : String not null;
    key Version : String not null;
    DeltaToken : String;
    LastUpdateTimestamp : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ScriptCollectionDesigntimeArtifacts {
    key Id : String not null;
    key Version : String not null;
    PackageId : String;
    Name : String;
    Description : String;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Resources : Association to many Resources {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DesignGuidelines {
    key GuidelineId : String not null;
    GuidelineName : String;
    Category : String;
    Severity : String;
    Applicability : String;
    Compliance : String;
    IsGuidelineSkipped : Boolean;
    SkipReason : String;
    SkippedBy : String;
    ExpectedKPI : String;
    ActualKPI : String;
    ViolatedComponents : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DesignGuidelineExecutionResults {
    key ExecutionId : String not null;
    ArtifactVersion : String;
    ExecutionStatus : String;
    ExecutionTime : String;
    ReportType : String;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    DesignGuidelines : Association to many DesignGuidelines {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DataTypeDesigntimeArtifacts {
    key Id : String not null;
    key Version : String not null;
    PackageId : String not null;
    Name : String not null;
    Namespace : String;
    Description : String;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageTypeDesigntimeArtifacts {
    key Id : String not null;
    key Version : String not null;
    PackageId : String not null;
    Name : String not null;
    Namespace : String;
    Description : String;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity FaultMessageTypeDesigntimeArtifacts {
    key Id : String not null;
    key Version : String not null;
    PackageId : String not null;
    Name : String not null;
    Namespace : String;
    Description : String;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity RuntimeArtifact {
    key id : String not null;
    name : String;
    symbolicName : String;
    type : String;
    version : String;
    nodeType : String;
    deployedBy : String;
    @odata.Type : 'Edm.DateTime'
    deployedOn : DateTime;
    deployState : String;
  };

  @cds.external : true
  type IntegrationArtifact {
    Id : String;
    Name : String;
    Type : String;
  };

  @cds.external : true
  type Scheduler {
    TriggerType : String;
    DateType : String;
    TimeType : String;
    Date : String;
    Time : String;
    DayOfMonth : String;
    Monday : Boolean;
    Tuesday : Boolean;
    Wednesday : Boolean;
    Thursday : Boolean;
    Friday : Boolean;
    Saturday : Boolean;
    Sunday : Boolean;
    OnEveryDuration : Integer;
    FromInterval : String;
    ToInterval : String;
    TimeZone : String;
  };

  @cds.external : true
  type Value {
    SrcValue : String;
    TgtValue : String;
  };

  @cds.external : true
  action DeployIntegrationDesigntimeArtifact(
    Id : String not null,
    Version : String not null
  ) returns IntegrationDesigntimeArtifacts;

  @cds.external : true
  action IntegrationDesigntimeArtifactSaveAsVersion(
    Id : String not null,
    SaveAsVersion : String not null
  ) returns IntegrationDesigntimeArtifacts;

  @cds.external : true
  action CopyIntegrationPackage(
    Id : String not null,
    ImportMode : String,
    Suffix : String
  ) returns IntegrationPackages;

  @cds.external : true
  action DeployValueMappingDesigntimeArtifact(
    Id : String not null,
    Version : String not null
  ) returns ValueMappingDesigntimeArtifacts;

  @cds.external : true
  action ValueMappingDesigntimeArtifactSaveAsVersion(
    Id : String not null,
    SaveAsVersion : String not null
  ) returns ValueMappingDesigntimeArtifacts;

  @cds.external : true
  action UpsertValMaps(
    Id : String not null,
    Version : String not null,
    SrcAgency : String not null,
    SrcId : String not null,
    TgtAgency : String not null,
    TgtId : String not null,
    ValMapId : String,
    SrcValue : String not null,
    TgtValue : String not null,
    IsConfigured : Boolean not null
  ) returns ValMaps;

  @cds.external : true
  action DeleteValMaps(
    Id : String not null,
    Version : String not null,
    SrcAgency : String not null,
    SrcId : String not null,
    TgtAgency : String not null,
    TgtId : String not null
  ) returns String;

  @cds.external : true
  action UpdateDefaultValMap(
    Id : String not null,
    Version : String not null,
    SrcAgency : String not null,
    SrcId : String not null,
    TgtAgency : String not null,
    TgtId : String not null,
    ValMapId : String not null,
    IsConfigured : Boolean not null
  ) returns DefaultValMaps;

  @cds.external : true
  action DeployIntegrationAdapterDesigntimeArtifact(
    Id : String not null
  ) returns IntegrationAdapterDesigntimeArtifacts;

  @cds.external : true
  action DeployMessageMappingDesigntimeArtifact(
    Id : String not null,
    Version : String not null
  ) returns MessageMappingDesigntimeArtifacts;

  @cds.external : true
  action MessageMappingDesigntimeArtifactSaveAsVersion(
    Id : String not null,
    SaveAsVersion : String not null
  ) returns MessageMappingDesigntimeArtifacts;

  @cds.external : true
  action DeployScriptCollectionDesigntimeArtifact(
    Id : String not null,
    Version : String not null
  ) returns ScriptCollectionDesigntimeArtifacts;

  @cds.external : true
  action ValidateIntegrationDesigntimeArtifact(
    Id : String not null,
    Version : String not null
  ) returns String;

  @cds.external : true
  action DataTypeDesigntimeArtifactSaveAsVersion(
    Id : String not null,
    SaveAsVersion : String not null
  ) returns DataTypeDesigntimeArtifacts;

  @cds.external : true
  action MessageTypeDesigntimeArtifactSaveAsVersion(
    Id : String not null,
    SaveAsVersion : String not null
  ) returns MessageTypeDesigntimeArtifacts;

  @cds.external : true
  action FaultMessageTypeDesigntimeArtifactSaveAsVersion(
    Id : String not null,
    SaveAsVersion : String not null
  ) returns FaultMessageTypeDesigntimeArtifacts;
};

