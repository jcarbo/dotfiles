import React from 'react';
import { Link } from 'react-router-dom';
import Helmet from 'react-helmet';
import gql from 'graphql-tag';
import { Query } from 'react-apollo';

import { AppLayout, MultiCard, Section } from '@gusto/component-library';

import queryHandler from 'koala/app/lib/utils/queryHandler';

import Bool from 'koala/app/components/Bool';
import DetailTable from 'koala/app/components/DetailTable';
import TaxLiabilitiesTable from 'koala/app/components/TaxLiabilitiesTable';
import Timestamp from 'koala/app/components/Timestamp';

const QUERY = gql`
  query TaxFilingQuery($id: ID!) {
    taxFiling(id: $id) {
      id
      company {
        id
        name
      }
      periodStartAt
      periodEndAt
      blockedReason
      submitByDate
      dueDate
      taxAgency {
        id
        name
      }
      taxLiabilities {
        ...TaxLiabilitiesTable_taxLiabilities
      }
      fromMasterTax
      createdAt
      updatedAt
    }
  }
  ${TaxLiabilitiesTable.fragments.taxLiabilities}
`;

const renderDescription = item => (
  <DetailTable>
    <DetailTable.Detail label="Id">{item.id}</DetailTable.Detail>
    <DetailTable.Detail label="Company">
      <Link to={`/companies/${item.company.id}`}>{item.company.name}</Link>
    </DetailTable.Detail>
    <DetailTable.Detail label="Period">
      {<Timestamp value={item.periodStartAt} />} — {<Timestamp value={item.periodEndAt} />}
    </DetailTable.Detail>
    <DetailTable.Detail label="Submit By Date">
      {<Timestamp value={item.submitByDate} />}
    </DetailTable.Detail>
    <DetailTable.Detail label="Due Date">{<Timestamp value={item.dueDate} />}</DetailTable.Detail>
    <DetailTable.Detail label="Tax Agency">
      <Link to={`/tax-agencies/${item.taxAgency.id}`}>{item.taxAgency.name}</Link>
    </DetailTable.Detail>
    <DetailTable.Detail label="From Master Tax">
      {<Bool value={item.fromMasterTax} />}
    </DetailTable.Detail>
    <DetailTable.Detail label="Created At">
      {<Timestamp value={item.createdAt} />}
    </DetailTable.Detail>
    <DetailTable.Detail label="Updated At">
      {<Timestamp value={item.updatedAt} />}
    </DetailTable.Detail>
    <DetailTable.Detail label="Blocked Reason">{item.blockedReason}</DetailTable.Detail>
  </DetailTable>
);

export default ({
  match: {
    params: { id },
  },
  history,
}) => (
  <Query query={QUERY} variables={{ id }} fetchPolicy="cache-and-network">
    {queryHandler(({ data }) => (
      <AppLayout.Body>
        <AppLayout.Body.Content>
          <Helmet title={`Tax Filing ${data.taxFiling.id}`} />

          <div className="row">
            <div className="col-sm-12">
              <h1 className="page-title">Tax Filing {data.taxFiling.id}</h1>
            </div>

            <div className="col-sm-12 col-md-10 col-lg-8">
              <MultiCard className="margin-bottom-20px">
                {renderDescription(data.taxFiling)}
              </MultiCard>
            </div>

            <div className="col-sm-12">
              <Section className="margin-bottom-20px">
                <Section.Header>Tax Liabilities</Section.Header>
                <TaxLiabilitiesTable
                  taxLiabilities={data.taxFiling.taxLiabilities}
                  history={history}
                />
              </Section>
            </div>
          </div>
        </AppLayout.Body.Content>
      </AppLayout.Body>
    ))}
  </Query>
);
