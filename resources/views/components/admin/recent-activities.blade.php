<section class="recent-activities">
    <h3>Recent Activities</h3>
    <ul>
        @if ($latestOrder)
            <li><span class="activity-type">New Order</span> - Order #{{ $latestOrder->id }} placed by {{ $latestOrder->user->name }}.</li>
        @else
            <li><li><span class="activity-type">New Order</span> - No Orders</li>
        @endif

        @if ($latestUser)
            <li><span class="activity-type">New User</span> - {{ $latestUser->name }} registered.</li>
        @else
            <li><span class="activity-type">New User</span> - No Users</li>
        @endif

        @if ($latestProduct)
            <li><span class="activity-type">Product Update</span> - Product "{{ $latestProduct->name }}" was updated.</li>
        @else
            <li><span class="activity-type">Product Update</span> - No Products </li>
        @endif
    </ul>
</section>
