<%@page import="java.util.List"%>
<%@page import="br.com.siscultbook.bean.Sexo"%>
<%@page import="br.com.siscultbook.bean.Estados"%>
<%@page import="br.com.siscultbook.bean.Status"%>
<%@page import="br.com.siscultbook.bean.NivelDeAcesso"%>
<%@page import="br.com.siscultbook.bean.EstadoCivil"%>

<%
            request.setAttribute("situacaoCivil", EstadoCivil.values());
%>
<%----%> 
<script type="text/javascript">
	$(document).ready(function(){
		$("#telefoneContato").mask("(99) 9999-9999");
		$("#cpf").mask("999.999.999-99");
		$("#cep").mask("99999-999");
	});
</script>
<link href="../cultbookFirefox.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="../css/screen.css" />
  <style>

#cadastros input.error {
	padding:0.15em;
	width:300px;
	border:1px solid #F00;
	background-color:#FFD2D2;
	font:bold 0.95em arial, sans-serif;
	-moz-border-radius:0.4em;
	-khtml-border-radius:0.4em;
}
#cadastros .radio label, #cadastros .radio input {
	vertical-align:middle;
	display:inline;
	float:none;
	width:auto;
	background:none;
	border:none;
}

</style>     
<div id="cadastros">
            <!-- path -->

        <div id="path">
            <ul>
                <li class="base">Voc� est� aqui:</li>
                <li class="first">${titulo}</li>

            </ul>
        </div>
        <!-- end path -->
        <div id="erro">
        	<font color="#FF0000" style="font-weight:bold">${erro}</font>
            <br />
        	${mensagem}
        </div>
        <!-- our error container -->
    <div class="erros">
        <h4>Acertes o erros para prosseguir:</h4>
        <ul class="disc">
            <li><label for="nomeCompleto" class="error">Informe nome, m&iacute;nimo 3 letras!</label></li>
            <li><label for="dataNascimento" class="error">Informe uma data v&aacute;lida!</label></li>
            <li><label for="sexo" class="error">Selecione o sexo!</label></li>
            <li><label for="telefoneContato" class="error">Informe o telefone!</label></li>
            <li><label for="emailContato" class="error">Informe um email v&aacute;lido!</label></li>
            <li><label for="rua" class="error">Informe a rua, m&iacute;nimo 3 caracteres!</label></li>
            <li><label for="bairro" class="error">Informe o bairro, m&iacute;nimo 3 caracteres!</label></li>
            <li><label for="cidade" class="error">Informe a cidade, m&iacute;nimo 3 caracteres!</label></li>
            <li><label for="cep" class="error">Informe o cep!</label></li>
            <li><label for="estado" class="error">Informe o estado!</label></li>
            <li><label for="estadoCivil" class="error">Informe o estado civil!</label></li>
            <li><label for="cpf" class="error">Informe um CPF v&aacute;lido!</label></li>
            <li><label for="senha" class="error">Informe a Senha!</label></li>
            <li><label for="nivelAcesso" class="error">Selecione o n�vel de acesso</label></li>
            <li><label for="statusUsuario" class="error">Selecione o status!</label></li>
        </ul>
    </div>
    <%--
        esse form a action dele vai enviar para o SisCultbookController, ele vai receber e redirecionar para
        SisCultbookHelper e o helper vai capturar o valor do paramentro "cmd" input hidden
        de acordo com o parametro ele ira tratar essa requisi��o e devolver para o SisCultbookController
        com uma p�gina de destino
    --%>
    <form name="form" id="form" action="SisCultbookController" method="post" >
        <input type='hidden' name='cmd' value="atualizarCliente" />
        <input type='hidden' name='codigo' value="${param.codigo}" />
        <fieldset class="EditarClientes">
        Os campos com (<font color="#ff0000">*</font>) s&atilde;o de preenchimento obrigat&oacute;rio:<br /><br />
            <legend>Informa&ccedil;&otilde;es do Cliente</legend>
            <div>
              <label for="nomeCompleto"><span id="obrigatorio">*</span> Nome Completo</label> 
              <input id="nomeCompleto" name="nomeCompleto" value="${cliente.nomeCompleto}" type="text" class="{validate:{required:true,minlength:3}}" tabindex="1">
            </div>
            <span style="font-size:11px; margin-left:150px;">ex: 12/12/1900</span>
            <div>
                <label for="dataNascimento"><span id="obrigatorio">*</span> Data Nascimento</label> 
                <input id="dataNascimento" name="dataNascimento" value="${clienteDataNascimento}" type="text" class="{validate:{required:true,dateBR:true}}" tabindex="2">
            </div>
            <div class="radio">
                <fieldset>

                    <legend><span class="stiloSpan"><font color="#FF0000">*</font> Sexo</span></legend>
                    <% for (Sexo sexo : Sexo.values()) {%>
                    <% if (sexo.equals(request.getAttribute("clienteSexo"))) {%>
                    <div class="fabrik_subelement" style="float: left; width: 98%; margin:0.2em 0 0 0;">
                        <input id="<%=sexo.name()%>" name="sexo" value="<%=sexo.name()%>" type="radio" checked class="{validate:{required:true}}" tabindex="3">
                        <label for="<%=sexo.name()%>"><%=sexo.name()%>.</label>
                    </div>
                    <% } else {%>
                    <div class="fabrik_subelement" style="float: left; width: 98%; margin:0.2em 0 0 0;">
                        <input id="<%=sexo.name()%>" name="sexo" value="<%=sexo.name()%>" type="radio" class="{validate:{required:true}}" tabindex="4">
                        <label for="<%=sexo.name()%>"><%=sexo.name()%>.</label>
                    </div>
                    <% }%>
                    <% }%>

                </fieldset>
            </div>
            <div>
                <label for="telefoneContato"><font color="#FF0000">*</font> Telefone</label> 
                <input id="telefoneContato" name="telefoneContato" value="${cliente.telefone}" type="text" class="{validate:{required:true}}" tabindex="5">
            </div>
            <div>
                <label for="emailContato"><font color="#FF0000">*</font> E-mail</label> 
                <input id="emailContato" name="emailContato" value="${cliente.email}" type="text" tabindex="6">
            </div>
            <div>
                <label for="cidadeContato"><font color="#FF0000">*</font> Rua</label> 
                <input id="rua" name="rua" value="${cliente.endereco.rua}" type="text" class="{validate:{required:true,minlength:3}}" tabindex="7">
            </div>
            <div>
                <label for="cidadeContato"><font color="#FF0000">*</font> Bairro</label> 
                <input id="bairro" name="bairro" value="${cliente.endereco.bairro}" type="text" class="{validate:{required:true,minlength:3}}" tabindex="8">
            </div>
            <div>
                <label for="cidadeContato"><font color="#FF0000">*</font> Cidade</label> 
                <input id="cidade" name="cidade" value="${cliente.endereco.cidade}" type="text" class="{validate:{required:true,minlength:3}}" tabindex="9">
            </div>
            <div>
                <label for="cepContato"><font color="#FF0000">*</font> CEP</label> 
                <input id="cep" name="cep" value="${cliente.endereco.cep}" type="text" class="{validate:{required:true}" tabindex="10">
            </div>

            <div>
                <label for="estado"><font color="#FF0000">*</font> Estado</label>
                <select name="estado" id="estado" class="fabrikinput inputbox"  tabindex="11">
                    <option value="" selected="selected">Escolha o estado</option>
                    <% for (Estados estado : Estados.values()) {%>
                    <% if (estado.equals(request.getAttribute("clienteEstado"))) {%>
                    <option value="<%=estado.name()%>" selected="selected" ><%=estado.name()%></option>
                    <% } else {%>
                    <option value="<%=estado.name()%>"><%=estado.name()%></option>
                    <% }%>
                    <% }%>
                </select>
            </div>
            <div class="radio">
                <fieldset>
                    <legend><span class="stiloSpan"><font color="#FF0000">*</font> Estado Civil</span></legend>
                    <% for (EstadoCivil situacao : EstadoCivil.values()) {%>
                    <% if (situacao.equals(request.getAttribute("clienteEstadoCivil"))) {%>
                    <div class="fabrik_subelement" style="float: left; width: 98%; margin:0.2em 0 0 0;">
                        <input id="<%=situacao.name()%>" name="estadoCivil" value="<%=situacao.name()%>" type="radio" checked  tabindex="12">
                        <label for="<%=situacao.name()%>"><%=situacao.name()%>.</label>
                    </div>
                    <% } else {%>
                    <div class="fabrik_subelement" style="float: left; width: 98%; margin:0.2em 0 0 0;">
                        <input id="<%=situacao.name()%>" name="estadoCivil" value="<%=situacao.name()%>" type="radio" tabindex="13">
                        <label for="<%=situacao.name()%>"><%=situacao.name()%>.</label>
                    </div>
                    <% }%>
                    <% }%>

                </fieldset>
            </div>
        </fieldset>
        <fieldset class="login">
            <legend>Informa&ccedil;&otilde;es de Login</legend>

            <div>
                <label for="cpf"><font color="#FF0000">*</font> CPF</label> 
                <input id="cpf" name="cpf" value="${cliente.cpf}" type="text" class="{validate:{required:true,verificaCPF:true}}" tabindex="14">
            </div>
            <div>
                <label for="Senha"><font color="#FF0000">*</font> Senha</label> 
                <input id="senha" name="senha" value="${cliente.loginCliente.senha}" type="password" tabindex="15">
            </div>
            <span style="font-size:11px; margin-left:150px;">ex: 12/12/1900</span>
            <div>
                <label for="desde"><font color="#FF0000">*</font> Data de Cadastro</label> 
                <input id="desde" name="desde" value="${clienteDataCadastro}" type="text" class="{validate:{required:true,dateBR:true}}" tabindex="16">
            </div>
            <div>
                <label for="nivelAcesso"><font color="#FF0000">*</font> N�vel de Acesso</label>
                <select name="nivelAcesso" id="nivelAcesso" class="fabrikinput inputbox {validate:{required:true}}" tabindex="17">
                    <option value="" >Selecione...</option>
                    <% List<NivelDeAcesso> acessos = (List<NivelDeAcesso>)request.getAttribute("NiveisDeAcesso"); %>
                    <% for (NivelDeAcesso niveis : acessos) {%>
                    <% if (niveis.getCodigoNivelDeAcesso().equals(request.getAttribute("clienteNivelAcesso"))) {%>
                    <option value="<%=niveis.getCodigoNivelDeAcesso()%>" selected="selected" ><%=niveis.getNivelDeAcesso() %></option>
                    <% } else {%>
                    <option value="<%=niveis.getCodigoNivelDeAcesso()%>"><%=niveis.getNivelDeAcesso()%></option>
                    <% }%>
                    <% }%>
                </select>
            </div>
            <div class="radio">
              <fieldset>
                    <legend><span class="stiloSpan"><font color="#FF0000">*</font> Status do Usu�rio</span></legend>
                    <% for (Status status : Status.values()) {%>
                    <% if (status.equals(request.getAttribute("clienteStatusUsuario"))) {%>
                    <div class="fabrik_subelement" style="float: left; width: 98%;margin:0.2em 0 0 0;">
                        <input id="<%=status.name()%>" name="statusUsuario" value="<%=status.name()%>" type="radio" checked class="{validate:{required:true}}" tabindex="18">
                        <label for="<%=status.name()%>"><%=status.name()%>.</label>
                    </div>
                    <% } else {%>
                    <div class="fabrik_subelement" style="float: left; width: 98%;margin:0.2em 0 0 0;">
                        <input id="<%=status.name()%>" name="statusUsuario" value="<%=status.name()%>" type="radio" class="{validate:{required:true}}" tabindex="19">
                        <label for="<%=status.name()%>"><%=status.name()%>.</label>
                    </div>
                    <% }%>
                    <% }%>
                </fieldset>
            </div>

        </fieldset>

        <div>
            <button type="submit" id="submit-go"  tabindex="20"><p style="margin-top:-4px;">Atualizar</p></button>
        </div>
    </form>
</div>