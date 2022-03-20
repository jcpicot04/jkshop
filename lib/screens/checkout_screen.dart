import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_ecommerce_app/widgets/custom_appbar.dart';
import 'package:flutter_ecommerce_app/widgets/custom_navbar.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(child: CircularProgressIndicator(),
              );
            }

            if(state is CheckoutLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'INFORMACIÓN DEL COMPRADOR',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                      UpdateCheckout(email: value)
                    );
                  }, context, 'Email'),
                  
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                      UpdateCheckout(fullName: value)
                    );
                  }, context, 'Nombre completo'),

                  Text(
                    'INFORMACIÓN DEL ENVÍO',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextFormField(
                      (value) {
                    context.read<CheckoutBloc>().add(
                      UpdateCheckout(address: value)
                    );
                  }, context, 'Dirección de envío'),

                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                      UpdateCheckout(city: value)
                    );
                  }, context, 'Ciudad'),

                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                      UpdateCheckout(country: value)
                    );
                  }, context, 'País'),

                  _buildTextFormField(
                      (value) {
                    context.read<CheckoutBloc>().add(
                      UpdateCheckout(zipCode: value)
                    );
                  }, context, 'Código postal'),

                  Text(
                    'DETALLES DEL PEDIDO',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  OrderSummary(),
                ],
              );
            } else{
              return Text('Algo ha salido mal');
            }

          },
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
