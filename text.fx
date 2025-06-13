If(
    IsBlank(TextBox2_6.Value) || //แท็งก์
    IsBlank(DataCardValue22_5.Selected) || // 
    IsBlank(TextBox2_5.Value) || // โซน
    IsBlank(DataCardValue22_4.Selected) || //
    IsBlank(TextBox1_19.Value) || // No.
    IsBlank(TextBox1_20.Value) || // ยี่ห้อ
    IsBlank(TextBox2_3.Value) || // สถานะ
    IsBlank(DataCardValue22_2.Selected) || // 
    IsBlank(TextBox2_4.Value) || // การเช็ค
    IsBlank(DataCardValue23_3.Selected) || // 
    IsBlank(Image4_5.Image) || // รูปภาพ

    IsBlank(TextBox1_21.Value) || // รายละเอียด
    IsBlank(TextBox1_22.Value) || // ขนาด
        
    IsBlank(TextBox1_23.Value) || //QIT
    IsBlank(TextBox1_24.Value) || // ผู้ตรวจสอบ
        
    IsBlank(TextBox1_25.Value) || // หมายเหตุ
    IsBlank(TextBox1_26.Value) || // GUID
        
    IsBlank(TextBox1_27.Value) || // โซน
    IsBlank(TextBox1_28.Value) || // ครั้งที่
    
    // กรณีกรอกไม่ครบ
    Notify("กรุณากรอกข้อมูลให้ครบถ้วน", NotificationType.Warning),

    // กรณีกรอกครบ → ลอง Patch + แจ้งผล
    IfError(
        If(
            IsBlank(selectedZoneDetails.Zone),
            Patch(
                Zones,
                Defaults(Zones),
                {
                    // 
                    // 
                    valve_no: TextBox1_8.Value,
                    valve_brand: TextBox1_10.Value,
                    valve_status: DataCardValue22_1.Selected.Value,
                    is_valve_checked: DataCardValue22.Selected.Value,
                    valve_image: Image4_3.Image,
                    valve_description: TextBox1_11.Value,
                    valve_size: TextBox1_18.Value,
                    valve_qit: Value(TextBox1_13.Value),
                    check_by: TextBox1_16.Value,
                    valve_note: TextBox1_17.Value,
                    Valve: selectedValveDetails.ValveGUID,
                    check_round: Value(TextBox1_15.Value)
                }
            ),
            Patch(
                Zones,
                LookUp(Zones, Zone = selectedZoneDetails.Zone),
                {
                    // 
                    valve_no: TextBox1_8.Value,
                    valve_brand: TextBox1_10.Value,
                    valve_status: DataCardValue22_1.Selected.Value,
                    is_valve_checked: DataCardValue22.Selected.Value,
                    valve_image: Image4_3.Image,
                    valve_description: TextBox1_11.Value,
                    valve_size: TextBox1_18.Value,
                    valve_qit: Value(TextBox1_13.Value),
                    check_by: TextBox1_16.Value,
                    valve_note: TextBox1_17.Value,
                    Valve: selectedValveDetails.ValveGUID,
                    check_round: Value(TextBox1_15.Value)
                }
            )
        ),
        Notify("เกิดข้อผิดพลาดในการบันทึก", NotificationType.Error),
        Notify("บันทึกข้อมูลสำเร็จ", NotificationType.Success)
    )
)


    If(
        !IsBlank(whoLoggedIn.EmployeeId),
        Set(varFlowResult, CreateNewValveCheckSheet.Run(
            JSON({ text: whoLoggedIn.EmployeeId })
        )),
        Notify("ไม่พบรหัสพนักงาน โปรดเข้าสู่ระบบ", NotificationType.Error)
    );

    If(
        !IsBlank(whoLoggedIn.EmployeeId),
        Notify("ระบบกำลังสร้างแบบฟอร์มตรวจสอบวาล์ว", NotificationType.Information)
    );
