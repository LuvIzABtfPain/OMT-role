<script src="{{ asset('admin/assets/js/plugins/jquery/dist/jquery.min.js') }}"></script>
<script src="{{ asset('admin/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
<!--   Optional JS   -->
<script src="{{ asset('admin/assets/js/plugins/chart.js/dist/Chart.min.js') }}"></script>
<script src="{{ asset('admin/assets/js/plugins/chart.js/dist/Chart.extension.js') }}"></script>
<!--   Argon JS   -->
<script src="{{ asset('admin/assets/js/argon-dashboard.min.js?v=1.1.2') }}"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script>
    window.TrackJS &&
    TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
    });
</script>
<script>
    jQuery(document).ready(function($) {
        $(".post").on("click",function(){
            $name = $('#cate_name').val();
            $id = $(this).attr("data-id");
            $.ajax({
                url: "http://alllaravel.test/admin/edit_cate",
                type: "GET",
                data: {
                    name: $name,
                    id: $id,
                },
                success: function (result) {
                    location.reload();
                },
                error: function(){
                    alert('edit that bai');
                }
            });
        });
    });
</script>
