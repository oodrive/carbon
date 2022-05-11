import 'package:beamer/beamer.dart';
import 'package:carbon/common/advices.dart';
import 'package:carbon/common/extensions.dart';
import 'package:carbon/common/scope_pie_chart.dart';
import 'package:carbon/common/widgets.dart';
import 'package:carbon/gen/assets.gen.dart';
import 'package:carbon/model/organization.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SiteScreen extends StatelessWidget {
  const SiteScreen();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OrganizationsState>();

    final Organization orga;
    final Site site;
    try {
      final beamState = context.currentBeamLocation.state as BeamState;
      final organizationId = beamState.pathParameters['organizationId'];
      final siteId = beamState.pathParameters['siteId'];

      orga = state.organizations.firstWhere((o) => o.id == organizationId);
      site = orga.sites.firstWhere((s) => s.id == siteId);
    } catch (_) {
      // handle exception by returning to home
      context.beamToNamed('/');
      return const Scaffold();
    }

    return ScreenTemplate(
      child: Stack(
        children: [
          const GreenHeader(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: Text('${orga.name} (${orga.year}) - ${site.name}'),
                actions: [_SiteMenuButton(state: state, orga: orga, site: site)],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 32, right: 48),
                child: Text(
                  Translation.current.siteScopesTitle,
                  style: context.textTheme.headline4?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 350,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(16),
                  children: [
                    ...site.getScopes().mapIndexed(
                          (idx, scope) => _ScopeItem(
                            organizationId: orga.id,
                            siteId: site.id,
                            scopeIdx: idx,
                            scope: scope,
                          ),
                        ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Translation.current.siteFootprintTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(16),
                    ScopesPieChart(
                      scope1Footprint: site.scope1.tCO2e(),
                      scope2Footprint: site.scope2.tCO2e(),
                      scope3Footprint: site.scope3.tCO2e(),
                    ),
                    const Gap(48),
                    Text(
                      Translation.current.howToReduceFootprint,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(24),
                    Advices(sites: [site]),
                    const Gap(48),
                    Text(
                      Translation.current.scopesExplanationTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(24),
                    Assets.scopes.image(
                      width: 800,
                    ),
                    const Gap(8),
                    AutoLinkMarkdown(data: Translation.current.scopesExplanationDescription),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScopeItem extends StatelessWidget {
  const _ScopeItem({
    Key? key,
    required this.organizationId,
    required this.siteId,
    required this.scopeIdx,
    required this.scope,
  }) : super(key: key);

  final String organizationId;
  final String siteId;
  final int scopeIdx;
  final Scope scope;

  @override
  Widget build(BuildContext context) {
    return GreenHeaderItem(
      onTap: () => context.beamToNamed('/$organizationId/$siteId/$scopeIdx'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Assets.scope.svg(
                  height: 96,
                ),
              ),
              Positioned(
                top: 66,
                left: 38,
                child: ScopeDot(scopeIdx: scopeIdx, isDark: true),
              ),
            ],
          ),
          const Gap(16),
          Text(
            scope.name(context),
            style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Gap(4),
          Text(
            scope.description(context),
            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Gap(16),
          Text(
            '${scope.tCO2e().toShortString(context, 1)} ${Translation.current.unitTonsCO2e}',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _SiteMenuButton extends StatelessWidget {
  const _SiteMenuButton({
    Key? key,
    required this.state,
    required this.orga,
    required this.site,
  }) : super(key: key);

  final OrganizationsState state;
  final Organization orga;
  final Site site;

  @override
  Widget build(BuildContext context) {
    return SimpleMenuButton(
      items: [
        SimpleMenuItem(
          text: Translation.current.deleteSite,
          icon: Icons.delete_outline,
          iconColor: Colors.red[300],
          onTap: () {
            showValidationDialog(context, () {
              Navigator.pop(context);
              Future<void>.delayed(400.milliseconds).then((_) {
                orga.sites.remove(site);
                state.update();
              });
            });
          },
        ),
      ],
    );
  }
}
