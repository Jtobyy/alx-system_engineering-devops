exec {'test':
  command => 'touch hello',
  path => '/usr/bin'
}
