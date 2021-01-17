'
' (c) Jose L. Fernandez
'
' Versión: 2015.4.19
'
' Resuelto error el línea 118 para ficheros sin extensión visualizada en el explorador
'
Option Explicit

Const NOMBREVBS = "FechaFicheros (versión 2015.04.15)"

Dim sNombreRaiz		' Nombre para los archivos
Dim iRespuesta		' Respuesta de MSGBOX
Dim strCarpeta		' Carpeta donde están los archivos a renombrar
Dim objShell		' Objeto Shell
Dim objCarpeta		' Objeto Carpeta
Dim objFichero		' Archivo a renombrar
Dim strGetDetailsOf ' Cadena devuelta por GetDetailsOf
Dim strFechaHora	' Fecha y hora del archivo a renombrar
Dim strFecha		' Fecha del archivo a renombrar
Dim strHora			' Hora del archivo a renombrar
Dim strNombreNuevo	' Nuevo nombre para el archivo
Dim objFSO			' Objeto FileSystemObject
Dim iRenombrados	' Número de archivos renombrados
Dim objNombreActual	' Objeto del archivo a renombrar
Dim iRepetidos		' Contador de archivos repetidos
Dim i				' Contador genérico

' Verifica número de parámetros pasados
If WScript.Arguments.Count < 1 Then
	MsgBox "Para renombrar los archivos de una carpeta, arrastre la carpeta sobre el icono de este programa.", vbInformation, NOMBREVBS
	WScript.Quit( 1 )
End If
If WScript.Arguments.Count > 1 Then
	MsgBox "Sólo se permite renombrar una carpeta cada vez.", vbCritical, NOMBREVBS
	WScript.Quit( 2 )
End If

' Toma el primer parámetro como nombre de la carpeta a tratar
strCarpeta = WScript.Arguments( 0 )

' Definición del objeto FileSystemObject
Set objFSO = CreateObject( "Scripting.FileSystemObject" )

' Definición del objeto Carpeta
Set objShell = CreateObject( "Shell.Application" )
Set objCarpeta = objShell.Namespace( strCarpeta )

' Verifica si la carpeta existe y tiene ficheros
If objCarpeta is Nothing Then
	MsgBox "La carpeta '" & strCarpeta & "' no existe.", vbCritical, NOMBREVBS
	WScript.Quit( 3 )
End If

' Pregunta el nombre del fichero
sNombreRaiz = InputBox( "Nombre para los archivos", NOMBREVBS, Mid( strCarpeta, InStrRev( strCarpeta, "\" ) + 1, 100 ) )

' Pide confirmación
iRespuesta = MsgBox( "Todos los archivos de la carpeta" & vbCrLf _
	& vbCrLf _
	& "'" & strCarpeta & "'" & vbCrLf _
	& vbCrLf _
	& "cambiaran su nombre por" & vbCrLf _
	& vbCrLf _
	& "'(aaaa-mm-dd hh-mm-nn) " & sNombreRaiz & ".xxx'" & vbCrLf _
	& vbCrLf _
	& "¿Desea continuar con el cambio de nombres?", vbYesNo + vbQuestion, NOMBREVBS )

' Cancela si el usuario lo deseó
If iRespuesta = 7 Then
	MsgBox "Proceso cancelado.", vbCritical, NOMBREVBS
	WScript.Quit( 4 )
End If

' Inicia contador de archivos renombrados
iRenombrados = 0

' Bucle para cada archivo de la carpeta
For Each objFichero in objCarpeta.Items

	' Si no es una carpeta se renombra
	If not objFichero.IsFolder Then

		' Fecha de captura de Windows 7
		strGetDetailsOf = objCarpeta.GetDetailsOf( objFichero, 12 ) & "."

		' Imagen tomada el día de Windows XP
		If strGetDetailsOf = "." Then
			strGetDetailsOf = objCarpeta.GetDetailsOf( objFichero, 25 ) & "."
		End If

		' Fecha de modificación de Windows XP y Windows 7
		If strGetDetailsOf = "." Then
			strGetDetailsOf = objCarpeta.GetDetailsOf( objFichero, 3 ) & "."
		End If

		' Elimina caracteres no imprimibles
		strFechaHora = ""
        For i = 1 To Len ( strGetDetailsOf )
			If Asc( Mid( strGetDetailsOf, i, 1 ) ) >= 32 And Asc( Mid( strGetDetailsOf, i, 1 ) ) <= 58 Then
				strFechaHora = strFechaHora & Mid( strGetDetailsOf, i, 1 )
			End If
		Next
		
		strFechaHora = Left( strFechaHora, Len( strFechaHora ) - 1 )

		strFecha = ( Year( strFechaHora ) * 10000 ) _
				+ ( Month( strFechaHora ) * 100 ) _
				+ ( Day( strFechaHora ) * 1 ) & ""
				
		strHora = 1000000 + ( Hour( strFechaHora ) * 10000 ) _
				+ ( Minute( strFechaHora ) * 100 ) _
				+ ( Second( strFechaHora ) * 1 ) _
				& ""

		strHora = Right( strHora, Len( strHora ) - 1 )
		
		' Bucle hasta que el nuevo nombre no exista
		iRepetidos = 100
		Do
				
			Set objNombreActual = objFSO.GetFile( objFichero.Path )
		
			' Compone el nuevo nombre
			strNombreNuevo = "(" _
				& Mid( strFecha, 1, 4 ) & "-" _
				& Mid( strFecha, 5, 2 ) & "-" _
				& Mid( strFecha, 7, 2 ) & " " _
				& Mid( strHora, 1, 2 ) & "-" _
				& Mid( strHora, 3, 2 ) & "-" _
				& Right( iRepetidos, 2 ) & ") " _
				& sNombreRaiz _
				& "." & LCase( objFSO.GetExtensionName( objNombreActual ) )
				
			iRepetidos = iRepetidos + 1
		
		Loop While objFSO.FileExists( strCarpeta & "\" & strNombreNuevo )

		' Renombra el fichero
		objFSO.MoveFile objFichero.Path , strCarpeta & "\" & strNombreNuevo

		' Aumenta el contador de archivos renombrados
		iRenombrados = iRenombrados + 1
		
	End If
	
Next

' Informa del número de archivos renombrados
MsgBox iRenombrados & " archivos renombrados.", vbInformation, NOMBREVBS

' Final feliz
WScript.Quit( 0 )

'
' EOF
'