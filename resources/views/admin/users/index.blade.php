@extends('admin.layouts.admin')

@section('content')
    <x-admin.header>
        Users
    </x-admin.header>
    <div class="users-table-container" style="background:#2a2a2a; padding:20px; border-radius:10px; box-shadow:0 4px 12px rgba(0,0,0,0.3);">
        <table style="width:100%; border-collapse:collapse; color:#fff;">
            <thead>
                <tr style="background:#1f1f1f; text-align:left;">
                    <th style="padding:12px;">ID</th>
                    <th style="padding:12px;">Ime</th>
                    <th style="padding:12px;">Email</th>
                    <th style="padding:12px;">Total spendings</th>
                    <th style="padding:12px;">Details</th>
                </tr>
            </thead>
            <tbody>
                @foreach($users as $user)
                    <tr style="border-bottom:1px solid #444;">
                        <td style="padding:12px;">{{ $user->id }}</td>
                        <td style="padding:12px;">{{ $user->name }}</td>
                        <td style="padding:12px;">{{ $user->email }}</td>
                        <td style="padding:12px; color:#ff6f61; font-weight:bold;">
                            $ {{ number_format($user->spent, 2) }}
                        </td>
                        <td style="padding:12px;">
                            <a href="" style="color:#ff6f61; font-weight:bold;">Show Details</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="pagination-container" id="pagination-container">
        {{ $users->links('vendor.pagination.custom') }}
    </div>
@endsection
