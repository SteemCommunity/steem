#ifdef IS_TEST_NET

#include <boost/test/unit_test.hpp>

#include <steem/chain/account_object.hpp>
#include <steem/chain/comment_object.hpp>
#include <steem/protocol/steem_operations.hpp>
#include <steem/plugins/json_rpc/json_rpc_plugin.hpp>

#include "../db_fixture/database_fixture.hpp"

using namespace steem::chain;
using namespace steem::protocol;

BOOST_FIXTURE_TEST_SUITE( json_rpc, json_rpc_database_fixture )

   BOOST_AUTO_TEST_CASE( witness_validation )
   {

      try
      {
         std::string request;

         request = R"({"jsonrpc":"2.0", "method":"call", "params":["witness_api", "get_account_bandwidth", {"account": "initminer", "type": "forum"}], "id":20 })";
         request = R"({"jsonrpc":"2.0", "method":"call", "params":["condenser_api", "get_account_bandwidth", ["initminer", "forum"]], "id":20 })";
         fc::variant answer = get_answer( request );
         ilog( "Witness response is ${o}", ( "o", answer ));

         BOOST_REQUIRE( answer.is_object());
         BOOST_REQUIRE( answer.get_object().contains( "result" ));
         BOOST_REQUIRE( answer.get_object().contains( "id" ));
         auto result = answer.get_object()[ "result" ].get_object();

         auto keys = {"id", "account", "type", "last_bandwidth_update", "lifetime_bandwidth", "average_bandwidth"};
         for (auto key : keys)
         {
            auto variant = result[ key ];
            ilog( "Witness response for key ${k} is ${r} of type ${t}",
                  ( "k", key )( "r", variant )( "t", variant.get_type()));
         }

         BOOST_REQUIRE(result["id"] == 1);


      }
      FC_LOG_AND_RETHROW()
   }

BOOST_AUTO_TEST_SUITE_END()

#endif
