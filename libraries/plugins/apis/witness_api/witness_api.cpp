#include <steem/plugins/witness_api/witness_api_plugin.hpp>
#include <steem/plugins/witness_api/witness_api.hpp>

namespace steem { namespace plugins { namespace witness {

namespace detail {

class witness_api_impl
{
   public:
      witness_api_impl() : _db( appbase::app().get_plugin< steem::plugins::chain::chain_plugin >().db() ) {}

      DECLARE_API_IMPL(
         (get_account_bandwidth)
         (get_reserve_ratio)
      )

      chain::database& _db;
};

#pragma message( "TODO: Bandwidth api can be removed later" )
DEFINE_API_IMPL( witness_api_impl, get_account_bandwidth )
{
   get_account_bandwidth_return result;
   account_bandwidth_object a;
   a.id = 1;
   a.account = args.account;
   a.type = args.type;
   a.average_bandwidth = 0;
   a.lifetime_bandwidth = 0;
   a.last_bandwidth_update = STEEM_GENESIS_TIME;
   result.bandwidth = a;

   return result;
}

#pragma message( "TODO: Reserve Ratio api can be removed later" )
DEFINE_API_IMPL( witness_api_impl, get_reserve_ratio )
{
   reserve_ratio_object r;
   r.id = 0;
   r.current_reserve_ratio = 200000000;
   r.average_block_size = 0;
   r.max_virtual_bandwidth = 0;
   return r;
}

} // detail

witness_api::witness_api(): my( new detail::witness_api_impl() )
{
   JSON_RPC_REGISTER_API( STEEM_WITNESS_API_PLUGIN_NAME );
}

witness_api::~witness_api() {}

DEFINE_READ_APIS( witness_api,
   (get_account_bandwidth)
   (get_reserve_ratio)
)

} } } // steem::plugins::witness
