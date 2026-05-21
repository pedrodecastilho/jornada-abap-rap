@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projeção de Equipamentos'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_EQUIP_PACS
  as projection on ZI_EQUIP_PACS
{
      @UI.hidden: true
  key EquipId,

      @UI.lineItem: [{ position: 10, label: 'Funcionário' }]
      EmployeeName,

      @UI.lineItem: [{ position: 20, label: 'Equipamento' }]
      EquipType,

      @UI.lineItem: [{ position: 30, label: 'Número de Série' }]
      SerialNumber,

      @UI.lineItem: [{ position: 40, label: 'Status do Empréstimo' }]
      Status,

      // Não precisamos exibir as datas de criação na tela principal por enquanto
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt
}
