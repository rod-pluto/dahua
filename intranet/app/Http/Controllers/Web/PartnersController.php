<?php

namespace App\Http\Controllers\Web;

use App\Http\Requests\Partner\StoreRequest;
use App\Http\Controllers\Controller;

use App\Models\Partner;
use App\Models\User;

class PartnersController extends Controller
{

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('web.partner');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRequest $request)
    {
        try {
            /**
             * TODO: inserir isso em uma operação transacional
             */
            $userPartner = User::create([
                'name'     => $request->input('name'),
                'email'    => $request->input('email'),
                'password' => bcrypt($request->input('email')),
            ]);
            $userPartner->role_id = 3; /** gambiarra: o campo não está no fillable do model */
            $userPartner->save();

            $info = Partner::create( [
                'user_id'     => $userPartner->id,
                'company'     => $request->input('company'),
                'message'     => $request->input('message'),
                'cellphone'   => $request->input('cellphone'),
                'looking_for' => $request->input('looking_for'),
            ] );

            return redirect()->back()->with([
                'status' => 'sucess',
                'message' => 'Pré-cadastro realizado.'
            ]);
        } catch(\Exception $e) {
            return redirect()->back()->withInput();
        }
    }
}
