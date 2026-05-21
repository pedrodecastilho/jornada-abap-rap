@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Básica de Equipamentos'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_EQUIP_PACS
  as select from ztb_equip_pacs as Equipment
{
  key equip_id              as EquipId,

      employee_name         as EmployeeName,
      equip_type            as EquipType,
      serial_number         as SerialNumber,
      status                as Status,

      @Semantics.user.createdBy: true
      created_by            as CreatedBy,

      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,

      @Semantics.user.localInstanceLastChangedBy: true
      last_changed_by       as LastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      local_last_changed_at as LocalLastChangedAt
}
