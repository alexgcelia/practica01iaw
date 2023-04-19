<h1>IAW - Práctica 01</h1>
1.	Crea una máquina instancia EC2 en AWS.
2.	Le ponemos un nombre (practica-01-alexg) y seleccionamos la Amazon Machine Image (AMI) que será una de Ubuntu Server, en este caso la última versión.

3.	Seleccionamos el tamaño que queremos que tenga nuestra máquina, en este caso la t2.small. En par de claves seleccionaremos la de vockey y creando la instancia debemos abrir los puertos para conectarnos por SSH y poder acceder por HTTP/HTTPS.

4.  Creamos un par de claves (pública y privada) para conectar por SSH con la instancia. Nos dirigiremos a "Direcciones IP elásticas", crea una y asígnala a la instancia EC2.

5.  Una vez asignada, iremos al laboratorio de nuestro AWS y descargaremos la key SSH en formato PEM. Renombramos el archivo a "vockey.pem" y la colocamos en una carpeta. 

6.  Nos conectamos a la máquina mediante ssh con el comando "ssh -i "vockey.pem" ubuntu@ec2-54-87-142-52.compute-1.amazonaws.com".

7.  Ahora nos dirigiremos al Visual Studio Code, descargamos la extensión "Remote - SSH" para poder conectarnos a la máquina. Con CTRL + SHIFT + P abriremos el archivo de configuración de SSH y colocamos los siguientes datos.
