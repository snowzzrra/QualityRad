<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="QualityRad.Pages.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Registro</title>
    <style>
html, body {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
}

.container {
    background-color: #00ADEE;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100vw; 
    height: 100vh; 
}

.register {
    padding: 10px;
    display: flex;
    background-color: #FFFFFF;
    border-radius: 10px;
    width: 15%;
    justify-content: left;
    flex-direction: column;
}

.form-item {
    margin-bottom: 10px;
    border-radius: 3px;
    border: none;
    padding: 10px;
    background-color: #EDF0F7;
    border: 1px solid #ADB5BD;
    width: 90%;

}

.form-button {
     margin-top: 15px;
     border-radius: 3px;
     border: none;
     padding: 10px;
     background-color: #00ADEE;
     color: #fff;
     font-weight: 900;
     cursor: pointer;
}

.form-button:hover {
     background-color: #0096D6;
}

.alreadyaccount {
     text-decoration: none;
     margin-top: 10px;
     font-size: 11px;
     text-align: center;
     color: #0096D6;
     cursor: pointer;
     font-weight: bold;
}

.alreadyaccount:hover {
    text-decoration: underline;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="register">
                <asp:TextBox runat="server" ID="nameTextBox" CssClass="form-item" placeholder="Razão social" />
                <asp:TextBox runat="server" ID="emailTextBox" CssClass="form-item" placeholder="Email" />
                <asp:TextBox runat="server" ID="passwordTextBox" CssClass="form-item" TextMode="Password" placeholder="Senha" />
                <asp:TextBox runat="server" ID="passwordConfirmTextBox" CssClass="form-item" TextMode="Password" placeholder="Confirmar senha" />
                <asp:TextBox runat="server" ID="phoneTextBox" CssClass="form-item" placeholder="Telefone" />
                <asp:Button runat="server" ID="registerButton" CssClass="form-button" Text="REGISTRAR-SE" OnClick="RegisterButton_Click" />
                <hr style="margin-top:20px; width:100%; border:1px solid #d6d6d6;" />
                <a href="#" class="alreadyaccount">Já tem uma conta?</a>
            </div>
        </div>
    </form>
</body>
</html>

