<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="QualityRad.Login.LoginPage" MasterPageFile="~/Site.Master" Title ="Login" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">

    <style>
html, body {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    background-color: #00ADEE;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.login {
    width: 225px;
    height: 300px;
    margin-top: 175px;
    padding: 20px;
    display: flex;
    background-color: #FFFFFF;
    border-radius: 10px;
    justify-content: center;
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

.baixo {
    margin-top: 10px;

}

.btn {
     margin-top: 15px;
     border-radius: 3px;
     border: none;
     padding: 10px;
     background-color: #00ADEE;
     color: #fff;
     font-weight: 900;
     cursor: pointer;
}

.btn:hover {
     background-color: #0096D6;
}

.esqueceuasenha {
     text-decoration: none;
     margin-top: 10px;
     font-size: 11px;
     text-align: center;
     color: #0096D6;
     cursor: pointer;
     font-weight: bold;
}

.esqueceuasenha:hover {
    text-decoration: underline;
}

    </style>
<div>
    <div id="form1" runat="server">
        <div class="container">
            <div class="login">
               <asp:Label ID="lblEmail" runat="server">Email:</asp:Label>
               <asp:TextBox ID="tbxEmail" CssClass="form-control" runat="server"></asp:TextBox>
               <asp:Label ID="lblSenha" runat="server">Senha:</asp:Label>
               <asp:TextBox ID="tbxSenha" CssClass="form-control" runat="server" TextMode="Password" ></asp:TextBox>               
                <div class="baixo">
               <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-success" Text="ENVIAR" OnClick="btnLogin_Click" />
                <hr style="margin-top:20px; width:100%; border:1px solid #d6d6d6;" />
                <a href="#" class="esqueceuasenha">Esqueceu a senha?</a>
                <a href="Registro.aspx" class="esqueceuasenha">Não tenho uma conta.</a>
            </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>