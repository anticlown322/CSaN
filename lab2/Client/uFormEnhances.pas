Unit uFormEnhances;

Interface

Uses
    Vcl.Controls, // for TWinControl
    Forms; // for TCustomForm

Type
    TCornerType = (CtRoundedCornerOff = 0, CtRoundedCornerDefault, CtRoundedCornerSmall, CtRoundedCornerLarge);

Procedure RoundFormCorners(SenderForm: TCustomForm; Const CornerType: TCornerType);
Procedure RoundCornerOf(Control: TWinControl; Const CornerType: TCornerType);
Procedure Dragging(SenderForm: TCustomForm);

Implementation

Uses
    Winapi.Windows, // for TRect, HRGN, Control, CreateRoundRectRgn and so on...
    Winapi.Messages; // for EM_GETRECT, EM_SETRECTNP

Procedure RoundFormCorners(SenderForm: TCustomForm; Const CornerType: TCornerType);
Var
    Rgn: HRGN;
    CorWidth: Integer;
    CorHeight: Integer;
Begin
    Case CornerType Of
        CtRoundedCornerOff:
            Begin
                CorWidth := 0;
                CorHeight := 0;
            End;
        CtRoundedCornerSmall:
            Begin
                CorWidth := 10;
                CorHeight := 10;
            End;
        CtRoundedCornerDefault:
            Begin
                CorWidth := 20;
                CorHeight := 20;
            End;
        CtRoundedCornerLarge:
            Begin
                CorWidth := 40;
                CorHeight := 40;
            End;
    End;

    Rgn := CreateRoundRectRgn(0, 0, SenderForm.ClientWidth, SenderForm.ClientHeight, CorWidth, CorHeight);
    SetWindowRgn(SenderForm.Handle, Rgn, True);
End;

Procedure RoundCornerOf(Control: TWinControl; Const CornerType: TCornerType);
Var
    Rect: TRect;
    Rgn: HRGN;
    CorWidth: Integer;
    CorHeight: Integer;
Begin
    With Control Do
    Begin
        Rect := ClientRect;

        Case CornerType Of
            CtRoundedCornerOff:
                Begin
                    CorWidth := 0;
                    CorHeight := 0;
                End;
            CtRoundedCornerSmall:
                Begin
                    CorWidth := 10;
                    CorHeight := 10;
                End;
            CtRoundedCornerDefault:
                Begin
                    CorWidth := 20;
                    CorHeight := 20;
                End;
            CtRoundedCornerLarge:
                Begin
                    CorWidth := 40;
                    CorHeight := 40;
                End;
        End;

        Rgn := CreateRoundRectRgn(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, CorWidth, CorHeight);
        Perform(EM_GETRECT, 0, LParam(@Rect));
        InflateRect(Rect, -4, -4);
        Perform(EM_SETRECTNP, 0, LParam(@Rect));
        SetWindowRgn(Handle, Rgn, True);
        Invalidate;
    End;
End;

Procedure Dragging(SenderForm: TCustomForm);
Begin
    ReleaseCapture;
    SenderForm.Perform(WM_SysCommand, $F012, 0);
End;

End.
