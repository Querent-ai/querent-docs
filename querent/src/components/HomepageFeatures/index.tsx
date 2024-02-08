import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Knowledge Graph Insights',
    Svg: require('@site/static/img/kg_insights.svg').default,
    description: (
      <>
        Querent provides powerful insights derived from knowledge graphs, allowing you to uncover relationships, patterns, and trends within your data.
      </>
    ),
  },
  {
    title: 'AI-driven Analytics',
    Svg: require('@site/static/img/ai_analytics.svg').default,
    description: (
      <>
        Querent leverages advanced artificial intelligence techniques to analyze and extract valuable insights from your data, enabling smarter decision-making.
      </>
    ),
  },
  {
    title: 'LLM-powered Search',
    Svg: require('@site/static/img/llm_search.svg').default,
    description: (
      <>
        Querent utilizes cutting-edge Large Language Models (LLMs) to enhance search capabilities, enabling more accurate and relevant results.
      </>
    ),
  },
  {
    title: 'Graph Neural Network Integration',
    Svg: require('@site/static/img/gnn_integration.svg').default,
    description: (
      <>
        Querent seamlessly integrates with Graph Neural Networks (GNNs) to analyze and interpret complex network structures, unlocking deeper insights from your data.
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
