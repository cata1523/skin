<?php
class ProveedoresModel extends Query{
 
    public function __construct()
    {
        parent::__construct();
    }
    public function getProveedores($estado)
    {
        $sql = "SELECT nit, nombre, telefono, correo, direccion FROM proveedores WHERE estado = $estado";
        return $this->selectAll($sql);
    }
    public function registrar($nit, $nombre, $telefono, $correo, $direccion)
    {
        $sql = "INSERT INTO proveedores(nit, nombre, telefono, correo, direccion) VALUES (?,?,?,?)";
        $array = array($nit, $nombre, $telefono, $correo, $direccion);
        return $this->insertar($sql, $array);
    }
    public function verificarCorreo($correo)
    {
        $sql = "SELECT correo FROM proveedores WHERE correo = '$correo' AND estado = 1";
        return $this->select($sql);
    }

    public function eliminar($nitProv)
    {
        $sql = "UPDATE proveedores SET estado = ? WHERE nit = ?";
        $array = array(0, $nitProv);
        return $this->save($sql, $array);
    }

    public function getProveedor($nitProv)
    {
        $sql = "SELECT nit, nombre, telefono, correo, direccion FROM proveedores WHERE nit = $nitProv";
        return $this->select($sql);
    }

    public function modificar($nombre, $telefono, $correo, $direccion, $nit)
    {
        $sql = "UPDATE proveedores SET nombre=?, telefono=?, correo=?, direccion=?,WHERE nit = ?";
        $array = array($nombre, $telefono, $correo, $direccion, $nit);
        return $this->save($sql, $array);
    }
}
 
?>