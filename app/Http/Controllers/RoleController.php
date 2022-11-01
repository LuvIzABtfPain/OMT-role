<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with('roles')->get();
        return view('admin.role', ['users'=>$users]);
    }
    public function delete_user($id){
        $victim = User::findOrFail($id);
        if(Auth::user()->can('delete', $victim->role)){
            $victim->delete();
            return redirect('/admin/role');
        }
    }
}
